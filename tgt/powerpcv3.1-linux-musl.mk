# SPDX-License-Identifier: 0BSD

target = powerpc-linux-musl
arch = powerpc

target_gcc_flags += --with-cpu=power10

include toolchain.mk
