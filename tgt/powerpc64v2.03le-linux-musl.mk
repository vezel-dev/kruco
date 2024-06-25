# SPDX-License-Identifier: 0BSD

target = powerpc64le-linux-musl
arch = powerpc

target_gcc_flags += --with-cpu=power5+

# Hits an error in libgcc because long double cannot be emulated.
#
# TODO: Potentially file a GCC bug for this?
gcc_target_flags += --disable-libquadmath

include toolchain.mk
