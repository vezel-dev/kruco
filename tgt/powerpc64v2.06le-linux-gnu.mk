# SPDX-License-Identifier: 0BSD

target = powerpc64le-linux-gnu
arch = powerpc

target_gcc_flags += --with-cpu=power7

# TODO: https://sourceware.org/bugzilla/show_bug.cgi?id=26360
gcc1_target_flags += --with-long-double-128

include toolchain.mk
