# SPDX-License-Identifier: 0BSD

arch = sparc

gcc_target_flags += --with-cpu=leon3

# libitm requires SPARC v9.
gcc2_target_flags += --disable-libitm

include toolchain.mk
