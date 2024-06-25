# SPDX-License-Identifier: 0BSD

target = x86_64-linux-gnu
arch = x86

target_gcc_flags += --with-arch=x86-64-v3

include toolchain.mk
