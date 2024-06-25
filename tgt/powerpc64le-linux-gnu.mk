# SPDX-License-Identifier: 0BSD

arch = powerpc

# TODO: https://sourceware.org/bugzilla/show_bug.cgi?id=26360
gcc1_target_flags += --with-long-double-128

include toolchain.mk
