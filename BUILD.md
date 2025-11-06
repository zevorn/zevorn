# RISC-V Server Platform Build Guide

## Target Configuration

**Branch**: `riscv-server-platform`  
**Target**: `riscv64-softmmu`  
**Architecture**: RISC-V 64-bit with Software MMU

## Prerequisites

- GCC/Clang compiler
- Make
- Git
- Python 3 (for build scripts)

## Quick Start

### 1. Configure for riscv64-softmmu

```bash
make configure
```

Or manually:

```bash
chmod +x configure.sh
./configure.sh
```

### 2. Build

```bash
make build
```

Or:

```bash
cd build
make -j$(nproc)
```

### 3. Install (optional)

```bash
sudo make install
```

## Configuration Options

The build system uses the following configuration:

- **Target**: riscv64-softmmu
- **Features**:
  - Vector extension support
  - Compressed instructions (RVC)
  - Atomic operations (A extension)
  - Floating-point (F/D extensions)
  - SV39/SV48 virtual memory

### Configuration File

Edit `configs/riscv64-softmmu.conf` to customize settings.

## Build Targets

- `make all` - Configure and build (default)
- `make configure` - Run configuration
- `make build` - Build the project
- `make clean` - Clean build artifacts
- `make distclean` - Complete cleanup
- `make install` - Install binaries
- `make help` - Show help

## Directory Structure

```
.
├── build/              # Build output directory
├── configs/            # Configuration files
│   └── riscv64-softmmu.conf
├── src/                # Source code
├── include/            # Header files
├── docs/               # Documentation
├── Makefile            # Main Makefile
├── config.mk           # Build configuration
└── configure.sh        # Configuration script
```

## Cleaning

Remove build artifacts:

```bash
make clean
```

Complete cleanup:

```bash
make distclean
```

## Troubleshooting

### Build fails

1. Ensure all prerequisites are installed
2. Run `make distclean` then try again
3. Check configuration in `configs/riscv64-softmmu.conf`

### Configuration issues

Re-run configuration:

```bash
make distclean
make configure
```

## Additional Information

For more details, see the documentation in the `docs/` directory.
