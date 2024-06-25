# SPDX-License-Identifier: 0BSD

target = powerpc-linux-gnu
arch = powerpc

target_gcc_flags += --with-cpu=power5

include toolchain.mk
