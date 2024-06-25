# SPDX-License-Identifier: 0BSD

target = aarch64_be-linux-musl
arch = arm64

gcc_target_flags = --with-arch=armv8.1-a

include toolchain.mk
