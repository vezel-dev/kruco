# SPDX-License-Identifier: 0BSD

arch = powerpc

# Hits an error in libgcc because long double cannot be emulated.
#
# TODO: Potentially file a GCC bug for this?
gcc_target_flags += --disable-libquadmath

include toolchain.mk
