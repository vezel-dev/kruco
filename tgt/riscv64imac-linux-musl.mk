# SPDX-License-Identifier: 0BSD

target = riscv64-linux-musl
arch = riscv

gcc_target_flags += --with-arch=rv64imac

include toolchain.mk
