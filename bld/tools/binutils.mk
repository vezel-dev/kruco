# SPDX-License-Identifier: 0BSD

binutils_flags += --build=$(build)
binutils_flags += --target=$(target)
binutils_flags += --prefix=$(prefix)
binutils_flags += --program-prefix=$(toolchain)-
binutils_flags += --with-babeltrace
binutils_flags += --with-debuginfod
binutils_flags += --with-expat
binutils_flags += --with-gdbtk
binutils_flags += --with-guile
binutils_flags += --with-jansson
binutils_flags += --with-lzma
# TODO: Re-enable --with-msgpack at some point.
binutils_flags += --with-python
binutils_flags += --with-sysroot=$(sysroot)
binutils_flags += --with-system-libunwind
binutils_flags += --with-system-zlib
binutils_flags += --with-xxhash
binutils_flags += --with-zstd
binutils_flags += --enable-colored-disassembly
binutils_flags += --enable-deterministic-archives
binutils_flags += --enable-f-for-ifunc-symbols
binutils_flags += --enable-host-bind-now
binutils_flags += --enable-host-pie
binutils_flags += --enable-libbacktrace
binutils_flags += --enable-libctf
binutils_flags += --disable-multilib
binutils_flags += --enable-plugins
binutils_flags += --enable-shared
binutils_flags += --enable-sim
binutils_flags += --enable-source-highlight
binutils_flags += --enable-threading
binutils_flags += --enable-tui

binutils_target_flags ?=

build-binutils:
>   $(Q)$(call cd_pkg,binutils-gdb) && $(RM) -f -r build && $(MKDIR) build
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && ../configure \
        $(binutils_flags) $(binutils_target_flags)
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && $(make_j)
>   $(Q)$(call cd_pkg,binutils-gdb) && cd build && $(make_j) install
