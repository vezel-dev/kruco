# SPDX-License-Identifier: 0BSD

target = riscv32-linux-gnu
arch = riscv

gcc_target_flags += --with-arch=rv32imac

include toolchain.mk
