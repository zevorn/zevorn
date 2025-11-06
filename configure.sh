#!/bin/bash
# RISC-V Server Platform - Configure script for riscv64-softmmu

set -e

echo "==================================="
echo "RISC-V Server Platform Configuration"
echo "Target: riscv64-softmmu"
echo "==================================="

# Configuration parameters
BUILD_DIR="build"
TARGET="riscv64-softmmu"
PREFIX="${PREFIX:-/usr/local}"

# Create build directory
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo ""
echo "Configuring for target: $TARGET"
echo "Installation prefix: $PREFIX"
echo ""

# Configure command (QEMU-style)
../configure \
    --target-list="$TARGET" \
    --prefix="$PREFIX" \
    --enable-kvm \
    --enable-debug \
    --enable-trace-backends=log

echo ""
echo "==================================="
echo "Configuration completed successfully!"
echo "==================================="
echo ""
echo "Next steps:"
echo "  1. Run 'make' to build"
echo "  2. Run 'make install' to install (may require sudo)"
echo ""
