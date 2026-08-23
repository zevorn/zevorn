#!/usr/bin/env bash

set -euo pipefail

readonly PROGRAM_NAME="oh-my-zevorn"
readonly PATH_BLOCK_BEGIN="# >>> oh-my-zevorn tools >>>"
readonly PATH_BLOCK_END="# <<< oh-my-zevorn tools <<<"

DRY_RUN=false
INSTALL_SKILLS=true
INSTALL_TOOLS=true
UPDATE_PATH=true
INSTALL_MODE="link"
BIN_DIR=""
AGENT_ARGS=()
SKILL_ARGS=()
AGENTS=()
SKILLS=()

usage() {
    cat <<'EOF'
Install Oh My Zevorn skills and tools globally for the current user.

Usage:
    ./install.sh [install] [options]

Options:
    -a, --agent NAME       Install skills for an agent. Repeat as needed.
                           Supported: codex, claude-code (default: both).
    -s, --skill NAME       Install one skill. Repeat as needed.
                           By default, every directory under skills/ is used.
        --bin-dir DIR      Install tools into DIR (default: ~/.local/bin).
        --link             Install using symbolic links (default).
        --copy             Install independent copies instead of links.
        --skills-only      Install skills without tools.
        --tools-only       Install tools without skills.
        --no-skills        Skip skill installation.
        --no-tools         Skip tool installation.
        --no-path-update   Do not add the tools directory to a shell rc file.
        --dry-run          Print the planned changes without writing anything.
    -g, --global           Accepted for compatibility; installation is global.
    -y, --yes              Accepted for compatibility; no prompts are used.
    -h, --help             Show this help.

Environment:
    CODEX_HOME             Override the Codex home directory.
    CLAUDE_CONFIG_DIR      Override the Claude Code configuration directory.
    OH_MY_ZEVORN_BIN_DIR   Override the default tools directory.
    OH_MY_ZEVORN_SHELL_RC  Override the shell rc file updated for PATH.

Behavior:
    By default, skills and executable tools are linked to this checkout, so
    repository changes take effect immediately. Keep the checkout at the same
    path while those links are installed.

    Use --copy for independent snapshots. In copy mode, skill directories are
    mirrored and executable tools are copied. When switching modes, an existing
    target is preserved beside the new installation with a
    .pre-oh-my-zevorn suffix.

    If the tools directory is not already in PATH, the installer adds a managed
    block to ~/.zshrc, ~/.bashrc, or ~/.profile according to the current shell.
EOF
}

die() {
    printf '%s: %s\n' "$PROGRAM_NAME" "$*" >&2
    exit 1
}

require_command() {
    command -v "$1" >/dev/null 2>&1 ||
        die "required command not found: $1"
}

append_unique() {
    local value="$1"
    shift
    local existing

    for existing in "$@"; do
        if [[ "$existing" == "$value" ]]; then
            return 1
        fi
    done

    return 0
}

resolve_repo_root() {
    local script_path="${BASH_SOURCE[0]:-}"
    local script_dir

    [[ -n "$script_path" && -f "$script_path" ]] ||
        die "run this installer from a local Oh My Zevorn checkout"

    script_dir="$(cd "$(dirname "$script_path")" && pwd -P)" ||
        die "could not resolve the installer directory"

    [[ -d "$script_dir/skills" ]] ||
        die "skills directory not found beside install.sh"
    [[ -d "$script_dir/tools" ]] ||
        die "tools directory not found beside install.sh"

    printf '%s\n' "$script_dir"
}

normalize_agent() {
    case "$1" in
        codex)
            printf 'codex\n'
            ;;
        claude|claude-code|cloud-code)
            printf 'claude-code\n'
            ;;
        *)
            die "unsupported agent: $1 (expected codex or claude-code)"
            ;;
    esac
}

agent_skills_root() {
    case "$1" in
        codex)
            printf '%s/skills\n' "${CODEX_HOME:-"$HOME/.codex"}"
            ;;
        claude-code)
            printf '%s/skills\n' "${CLAUDE_CONFIG_DIR:-"$HOME/.claude"}"
            ;;
        *)
            die "internal error: unsupported agent: $1"
            ;;
    esac
}

resolve_shell_rc() {
    if [[ -n "${OH_MY_ZEVORN_SHELL_RC:-}" ]]; then
        printf '%s\n' "$OH_MY_ZEVORN_SHELL_RC"
        return
    fi

    case "${SHELL:-}" in
        zsh|*/zsh)
            printf '%s/.zshrc\n' "$HOME"
            ;;
        bash|*/bash)
            printf '%s/.bashrc\n' "$HOME"
            ;;
        *)
            printf '%s/.profile\n' "$HOME"
            ;;
    esac
}

path_contains() {
    local directory="$1"
    case ":${PATH:-}:" in
        *":${directory}:"*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

next_backup_path() {
    local target="$1"
    local backup="${target}.pre-oh-my-zevorn"
    local suffix=1

    while [[ -e "$backup" || -L "$backup" ]]; do
        backup="${target}.pre-oh-my-zevorn-${suffix}"
        suffix=$((suffix + 1))
    done

    printf '%s\n' "$backup"
}

preserve_existing_target() {
    local target="$1"
    local backup

    [[ -e "$target" || -L "$target" ]] || return 0

    backup="$(next_backup_path "$target")"
    if [[ "$DRY_RUN" == true ]]; then
        printf '[dry-run] Preserve existing %s as %s\n' "$target" "$backup"
        return
    fi

    mv "$target" "$backup"
    printf 'Preserved existing target: %s\n' "$backup"
}

install_link() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
        printf 'Already linked: %s -> %s\n' "$target" "$source"
        return
    fi

    preserve_existing_target "$target"
    if [[ "$DRY_RUN" == true ]]; then
        printf '[dry-run] Link %s -> %s\n' "$target" "$source"
        return
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    printf 'Linked %s -> %s\n' "$target" "$source"
}

configure_path() {
    local bin_dir="$1"
    local shell_rc
    local export_line

    if [[ "$UPDATE_PATH" == false ]]; then
        printf 'Skipping PATH configuration.\n'
        return
    fi

    if path_contains "$bin_dir"; then
        printf 'Tools directory is already in PATH: %s\n' "$bin_dir"
        return
    fi

    shell_rc="$(resolve_shell_rc)"
    export_line="export PATH=\"$bin_dir:\$PATH\""

    if [[ "$DRY_RUN" == true ]]; then
        printf '[dry-run] Add PATH block to %s:\n' "$shell_rc"
        printf '  %s\n' "$export_line"
        return
    fi

    if [[ -f "$shell_rc" ]] && grep -Fq "$PATH_BLOCK_BEGIN" "$shell_rc"; then
        grep -Fq "$PATH_BLOCK_END" "$shell_rc" ||
            die "unterminated managed PATH block in $shell_rc"
        grep -Fqx "$export_line" "$shell_rc" ||
            die "managed PATH block in $shell_rc uses another directory"
        printf 'PATH block is already configured in %s\n' "$shell_rc"
        return
    fi

    mkdir -p "$(dirname "$shell_rc")"
    if [[ -s "$shell_rc" ]]; then
        printf '\n' >>"$shell_rc"
    fi
    {
        printf '%s\n' "$PATH_BLOCK_BEGIN"
        printf '%s\n' "$export_line"
        printf '%s\n' "$PATH_BLOCK_END"
    } >>"$shell_rc"

    printf 'Added tools directory to PATH in %s\n' "$shell_rc"
}

discover_skills() {
    local skills_dir="$1"
    local skill_dir
    local skill_name

    if ((${#SKILL_ARGS[@]} > 0)); then
        for skill_name in "${SKILL_ARGS[@]}"; do
            [[ "$skill_name" =~ ^[a-z0-9][a-z0-9-]*$ ]] ||
                die "invalid skill name: $skill_name"
            [[ -f "$skills_dir/$skill_name/SKILL.md" ]] ||
                die "skill not found: $skill_name"
            if append_unique "$skill_name" "${SKILLS[@]+"${SKILLS[@]}"}"; then
                SKILLS+=("$skill_name")
            fi
        done
        return
    fi

    for skill_dir in "$skills_dir"/*; do
        [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
        skill_name="$(basename "$skill_dir")"
        SKILLS+=("$skill_name")
    done

    ((${#SKILLS[@]} > 0)) || die "no skills found under $skills_dir"
}

resolve_agents() {
    local requested_agent
    local normalized_agent

    if ((${#AGENT_ARGS[@]} == 0)); then
        AGENT_ARGS=(codex claude-code)
    fi

    for requested_agent in "${AGENT_ARGS[@]}"; do
        normalized_agent="$(normalize_agent "$requested_agent")"
        if append_unique \
            "$normalized_agent" "${AGENTS[@]+"${AGENTS[@]}"}"; then
            AGENTS+=("$normalized_agent")
        fi
    done
}

install_skills() {
    local skills_dir="$1"
    local agent
    local skills_root
    local skill
    local source_dir
    local target_dir

    resolve_agents
    discover_skills "$skills_dir"
    if [[ "$INSTALL_MODE" == "copy" ]]; then
        require_command rsync
    else
        require_command ln
        require_command readlink
    fi

    for agent in "${AGENTS[@]}"; do
        skills_root="$(agent_skills_root "$agent")"
        for skill in "${SKILLS[@]}"; do
            source_dir="$skills_dir/$skill"
            target_dir="$skills_root/$skill"

            if [[ "$INSTALL_MODE" == "link" ]]; then
                install_link "$source_dir" "$target_dir"
                continue
            fi

            if [[ -L "$target_dir" ||
                  (-e "$target_dir" && ! -d "$target_dir") ]]; then
                preserve_existing_target "$target_dir"
            fi
            if [[ "$DRY_RUN" == true ]]; then
                printf '[dry-run] Mirror %s -> %s\n' "$source_dir" "$target_dir"
                continue
            fi

            mkdir -p "$target_dir"
            rsync -a --delete -- "$source_dir/" "$target_dir/"
            printf 'Installed %s for %s: %s\n' \
                "$skill" "$agent" "$target_dir"
        done
    done
}

install_tools() {
    local tools_dir="$1"
    local tool
    local target
    local installed_count=0

    if [[ "$INSTALL_MODE" == "copy" ]]; then
        require_command install
    else
        require_command ln
        require_command readlink
    fi
    [[ "$BIN_DIR" == /* ]] ||
        die "tools directory must be an absolute path: $BIN_DIR"

    if [[ "$DRY_RUN" == false ]]; then
        mkdir -p "$BIN_DIR"
    fi

    for tool in "$tools_dir"/*; do
        [[ -f "$tool" && -x "$tool" ]] || continue
        target="$BIN_DIR/$(basename "$tool")"
        installed_count=$((installed_count + 1))

        if [[ "$INSTALL_MODE" == "link" ]]; then
            install_link "$tool" "$target"
        elif [[ "$DRY_RUN" == true ]]; then
            printf '[dry-run] Install tool %s -> %s\n' "$tool" "$target"
        else
            if [[ -L "$target" ]]; then
                preserve_existing_target "$target"
            fi
            install -m 0755 "$tool" "$target"
            printf 'Installed tool: %s\n' "$target"
        fi
    done

    ((installed_count > 0)) ||
        die "no executable tools found under $tools_dir"

    configure_path "$BIN_DIR"
}

main() {
    local repo_root

    if [[ "${1:-}" == "install" ]]; then
        shift
    fi

    while (($# > 0)); do
        case "$1" in
            -a|--agent)
                (($# >= 2)) || die "$1 requires an agent name"
                [[ "$2" != -* ]] || die "$1 requires an agent name"
                AGENT_ARGS+=("$2")
                shift 2
                ;;
            --agent=*)
                [[ -n "${1#--agent=}" ]] ||
                    die "--agent requires an agent name"
                AGENT_ARGS+=("${1#--agent=}")
                shift
                ;;
            -s|--skill)
                (($# >= 2)) || die "$1 requires a skill name"
                [[ "$2" != -* ]] || die "$1 requires a skill name"
                SKILL_ARGS+=("$2")
                shift 2
                ;;
            --skill=*)
                [[ -n "${1#--skill=}" ]] ||
                    die "--skill requires a skill name"
                SKILL_ARGS+=("${1#--skill=}")
                shift
                ;;
            --bin-dir)
                (($# >= 2)) || die "--bin-dir requires a directory"
                [[ "$2" != -* ]] || die "--bin-dir requires a directory"
                BIN_DIR="$2"
                shift 2
                ;;
            --bin-dir=*)
                BIN_DIR="${1#--bin-dir=}"
                [[ -n "$BIN_DIR" ]] || die "--bin-dir requires a directory"
                shift
                ;;
            --link)
                INSTALL_MODE="link"
                shift
                ;;
            --copy)
                INSTALL_MODE="copy"
                shift
                ;;
            --skills-only)
                INSTALL_SKILLS=true
                INSTALL_TOOLS=false
                shift
                ;;
            --tools-only)
                INSTALL_SKILLS=false
                INSTALL_TOOLS=true
                shift
                ;;
            --no-skills)
                INSTALL_SKILLS=false
                shift
                ;;
            --no-tools)
                INSTALL_TOOLS=false
                shift
                ;;
            --no-path-update)
                UPDATE_PATH=false
                shift
                ;;
            --dry-run)
                DRY_RUN=true
                shift
                ;;
            -g|--global|-y|--yes)
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                die "unknown option: $1"
                ;;
        esac
    done

    [[ -n "${HOME:-}" && "$HOME" == /* && "$HOME" != "/" ]] ||
        die "HOME must be an absolute user directory"
    [[ "$INSTALL_SKILLS" == true || "$INSTALL_TOOLS" == true ]] ||
        die "nothing to install"

    if [[ -z "$BIN_DIR" ]]; then
        BIN_DIR="${OH_MY_ZEVORN_BIN_DIR:-"$HOME/.local/bin"}"
    fi

    require_command basename
    require_command grep
    repo_root="$(resolve_repo_root)"

    printf 'Oh My Zevorn source: %s\n' "$repo_root"
    if [[ "$INSTALL_SKILLS" == true ]]; then
        install_skills "$repo_root/skills"
    fi
    if [[ "$INSTALL_TOOLS" == true ]]; then
        install_tools "$repo_root/tools"
    fi

    printf 'Oh My Zevorn installation complete.\n'
    if [[ "$INSTALL_TOOLS" == true &&
          "$DRY_RUN" == false ]] &&
          ! path_contains "$BIN_DIR"; then
        if [[ "$UPDATE_PATH" == true ]]; then
            printf 'Open a new shell or source the configured shell rc file to use tools.\n'
        else
            printf 'Add %s to PATH before using the installed tools.\n' "$BIN_DIR"
        fi
    fi
}

main "$@"
