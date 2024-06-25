# SPDX-License-Identifier: 0BSD

target = powerpc64-linux-musl
arch = powerpc

target_gcc_flags += --with-cpu=power8

# TODO: Remove this if/when GCC makes it the default for musl targets.
gcc_target_flags += --with-abi=elfv2

include toolchain.mk
