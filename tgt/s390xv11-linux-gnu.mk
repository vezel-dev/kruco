# SPDX-License-Identifier: 0BSD

target = s390x-linux-gnu
arch = s390

target_gcc_flags += --with-arch=arch11

include toolchain.mk
