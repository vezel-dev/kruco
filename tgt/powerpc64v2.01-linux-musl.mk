# SPDX-License-Identifier: 0BSD

target = powerpc64-linux-musl
arch = powerpc

# POWER4 was 2.00 and POWER4+ was 2.01. GCC seems to treat them as one and the
# same. As such, it is unclear whether anything substantial actually changed
# between the two ISA versions.
#
# TODO: Locate some ancient documentation to confirm this.
target_gcc_flags += --with-cpu=power4

# TODO: Remove this if/when GCC makes it the default for musl targets.
gcc_target_flags += --with-abi=elfv2

include toolchain.mk
