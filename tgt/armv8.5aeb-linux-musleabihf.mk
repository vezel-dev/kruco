# SPDX-License-Identifier: 0BSD

arch = arm

gcc_target_flags += --with-arch=armv8.5-a+simd

include toolchain.mk
