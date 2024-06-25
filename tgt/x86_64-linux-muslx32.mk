# SPDX-License-Identifier: 0BSD

arch = x86

# TODO: Remove this when GCC starts recognizing muslx32 like LLVM does.
gcc_target_flags += --with-abi=x32

include toolchain.mk
