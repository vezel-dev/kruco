# SPDX-License-Identifier: 0BSD

target = x86_64-linux-gnu
arch = x86

target_gcc_flags += --with-arch=x86-64

# TODO: Remove this when GCC starts recognizing muslx32 like LLVM does.
gcc_target_flags += --with-abi=x32

include toolchain.mk
