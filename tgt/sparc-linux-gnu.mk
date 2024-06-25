# SPDX-License-Identifier: 0BSD

arch = sparc

# glibc only supports v8+. GCC generates libatomic calls for v8 and earlier, but
# libatomic itself only works for v9+. So it appears we have no choice but to
# pick v9 as the baseline here.
#
# TODO: Seems like there should be a way to support v8...
gcc_target_flags += --with-cpu=v9

include toolchain.mk
