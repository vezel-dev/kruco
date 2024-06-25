# SPDX-License-Identifier: 0BSD

target = powerpc64le-linux-musl
arch = powerpc

# POWER4 was 2.00 and POWER4+ was 2.01. GCC seems to treat them as one and the
# same. As such, it is unclear whether anything substantial actually changed
# between the two ISA versions.
#
# TODO: Locate some ancient documentation to confirm this.
target_gcc_flags += --with-cpu=power4

# Hits an error in libgcc because long double cannot be emulated.
#
# TODO: Potentially file a GCC bug for this?
gcc_target_flags += --disable-libquadmath

include toolchain.mk
