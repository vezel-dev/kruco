# SPDX-License-Identifier: 0BSD

target = powerpc64-linux-gnu
arch = powerpc

target_gcc_flags += --with-cpu=power5+

include toolchain.mk
