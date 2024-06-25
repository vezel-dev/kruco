# SPDX-License-Identifier: 0BSD

target = aarch64-linux-musl
arch = arm64

gcc_target_flags = --with-arch=armv9.1-a

include toolchain.mk
