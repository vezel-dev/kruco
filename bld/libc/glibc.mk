# SPDX-License-Identifier: 0BSD

libc_flags += --host=$(target)
libc_flags += --prefix=/usr
libc_flags += --with-headers=$(sysroot)/usr/include
libc_flags += --enable-memory-tagging
libc_flags += --disable-werror

libc_kernel_flags ?=
libc_target_flags ?=

# We do not build multilib toolchains, and so glibc's insistence on putting
# libraries in multilib directories like /lib64 on some platforms causes all
# sorts of breakage (e.g. failure to find crti.o when linking libgcc for stage-2
# GCC).
#
# TODO: Find a better way to disable multilib paths.
slibdir_hack = libc_cv_slibdir=/lib

build-libc: build-kernel build-gcc1
>   $(Q)$(call cd_pkg,glibc) && $(RM) -f -r build && $(MKDIR) build
>   $(Q)$(call cd_pkg,glibc) && cd build && ../configure \
        $(libc_flags) $(libc_kernel_flags) $(libc_target_flags) \
        CC=$(prefix)/bin/$(toolchain)-gcc \
        CXX=$(prefix)/bin/$(toolchain)-g++ \
        GPROF=$(prefix)/bin/$(toolchain)-gprof \
        $(slibdir_hack)
>   $(Q)$(call cd_pkg,glibc) && cd build && $(make_j)
>   $(Q)$(call cd_pkg,glibc) && cd build && $(make_j) install \
        DESTDIR=$(sysroot)
