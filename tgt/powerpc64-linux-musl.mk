# SPDX-License-Identifier: 0BSD

arch = powerpc

# TODO: Remove this if/when GCC makes it the default for musl targets.
gcc_target_flags += --with-abi=elfv2

include toolchain.mk
