# RISC-V Server Platform Makefile
# Target: riscv64-softmmu

.PHONY: all configure build clean distclean help

# Default target
all: configure build

# Configuration
configure:
	@echo "Configuring for riscv64-softmmu..."
	@chmod +x configure.sh
	@./configure.sh

# Build
build:
	@echo "Building riscv64-softmmu..."
	@if [ -d build ]; then \
		cd build && $(MAKE) -j$$(nproc); \
	else \
		echo "Error: Please run 'make configure' first"; \
		exit 1; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@if [ -d build ]; then \
		cd build && $(MAKE) clean; \
	fi

# Complete cleanup
distclean:
	@echo "Removing build directory..."
	@rm -rf build

# Install
install:
	@echo "Installing riscv64-softmmu..."
	@if [ -d build ]; then \
		cd build && $(MAKE) install; \
	else \
		echo "Error: Please build first"; \
		exit 1; \
	fi

# Help
help:
	@echo "RISC-V Server Platform Build System"
	@echo "===================================="
	@echo ""
	@echo "Available targets:"
	@echo "  all        - Configure and build (default)"
	@echo "  configure  - Run configuration for riscv64-softmmu"
	@echo "  build      - Build the project"
	@echo "  clean      - Clean build artifacts"
	@echo "  distclean  - Remove build directory completely"
	@echo "  install    - Install built binaries"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Target: riscv64-softmmu"
	@echo ""
