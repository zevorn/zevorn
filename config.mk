# RISC-V Server Platform Configuration
# Build configuration for riscv64-softmmu

# Target architecture
TARGET_ARCH = riscv64-softmmu

# Compiler settings
CC ?= gcc
CXX ?= g++
CFLAGS += -O2 -g -Wall
CXXFLAGS += -O2 -g -Wall

# Build type
BUILD_TYPE ?= release

# Installation prefix
PREFIX ?= /usr/local

# Feature flags
ENABLE_KVM = yes
ENABLE_DEBUG = yes
ENABLE_TRACE = yes

# Build directory
BUILD_DIR = build

# Version
VERSION = 1.0.0
