# SPDX-License-Identifier: 0BSD

# libsanitizer does not work with musl.
gcc2_libc_flags += --disable-libsanitizer
