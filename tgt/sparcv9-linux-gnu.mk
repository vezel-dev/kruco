# SPDX-License-Identifier: 0BSD

target = sparc-linux-gnu
arch = sparc

gcc_target_flags += --with-cpu=v9

include toolchain.mk
