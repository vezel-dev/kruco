# SPDX-License-Identifier: 0BSD

binutils_flags += --build=$(build)
binutils_flags += --target=$(target)
binutils_flags += --prefix=$(prefix)
binutils_flags += --program-prefix=$(toolchain)-
binutils_flags += --with-jansson
binutils_flags += --with-msgpack
binutils_flags += --with-sysroot=$(sysroot)
binutils_flags += --with-system-libunwind
binutils_flags += --with-system-zlib
binutils_flags += --with-zstd
binutils_flags += --enable-colored-disassembly
binutils_flags += --enable-deterministic-archives
binutils_flags += --enable-f-for-ifunc-symbols
binutils_flags += --enable-host-bind-now
binutils_flags += --enable-host-pie
binutils_flags += --disable-multilib
binutils_flags += --enable-shared

# TODO: https://sourceware.org/bugzilla/show_bug.cgi?id=31399
binutils_flags += --disable-gdb

binutils_target_flags ?=

build-binutils:
>   $(Q)$(call cd_pkg,binutils-gdb) && $(RM) -f -r build && $(MKDIR) build
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && ../configure \
        $(binutils_flags) $(binutils_target_flags)
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && $(make_j)
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && $(make_j) install
