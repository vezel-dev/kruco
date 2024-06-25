# SPDX-License-Identifier: 0BSD

libc_flags += --host=$(target)
libc_flags += --prefix=/usr

libc_kernel_flags ?=
libc_target_flags ?=

build-libc: build-gcc1 build-kernel
>   $(Q)$(call cd_pkg,musl) && $(RM) -f -r build && $(MKDIR) build
>   $(Q)$(call cd_pkg,musl) && cd build && ../configure \
        $(libc_flags) $(libc_kernel_flags) $(libc_target_flags) \
        CROSS_COMPILE=$(prefix)/bin/$(toolchain)-
>   $(Q)$(call cd_pkg,musl) && cd build && $(make_j) install \
        DESTDIR=$(sysroot)
