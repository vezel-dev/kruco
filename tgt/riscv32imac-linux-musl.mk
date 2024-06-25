# SPDX-License-Identifier: 0BSD

target = riscv32-linux-musl
arch = riscv

gcc_target_flags += --with-arch=rv32imac

include toolchain.mk
