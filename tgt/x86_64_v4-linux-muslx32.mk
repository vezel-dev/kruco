# SPDX-License-Identifier: 0BSD

target = x86_64-linux-gnu
arch = x86

target_gcc_flags += x86-64-v4

# TODO: Remove this when GCC starts recognizing muslx32 like LLVM does.
gcc_target_flags += --with-abi=x32

include toolchain.mk
