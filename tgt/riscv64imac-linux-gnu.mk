# SPDX-License-Identifier: 0BSD

target = riscv64-linux-gnu
arch = riscv

gcc_target_flags += --with-arch=rv64imac

include toolchain.mk
