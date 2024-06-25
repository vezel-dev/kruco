# SPDX-License-Identifier: 0BSD

gcc_flags += --build=$(build)
gcc_flags += --target=$(target)
gcc_flags += --prefix=$(prefix)
gcc_flags += --program-prefix=$(toolchain)-
gcc_flags += --with-gxx-include-dir=$(sysroot)/usr/include/c++
gcc_flags += --with-sysroot=$(sysroot)
gcc_flags += --with-system-readline
gcc_flags += --with-system-zlib
gcc_flags += --with-toolexeclibdir=$(sysroot)/usr/lib
gcc_flags += --enable-host-bind-now
gcc_flags += --enable-host-pie
gcc_flags += --enable-multiarch
gcc_flags += --disable-multilib

# TODO: Remove this when we no longer support obsolete targets (e.g. ia64, nios2).
gcc_flags += --enable-obsolete

gcc_kernel_flags ?=
gcc_libc_flags ?=
gcc_target_flags ?=

# $(1) = stage
# $(2) = dependency
# $(3) = build targets
# $(4) = install targets
define build_gcc
$(eval gcc$(1)_kernel_flags ?=)
$(eval gcc$(1)_libc_flags ?=)
$(eval gcc$(1)_target_flags ?=)

build-gcc$(1): build-$(2)
>   $(Q)$(call cd_pkg,gcc) && $(RM) -f -r build && $(MKDIR) build
>   $(Q)$(call cd_pkg,gcc) && cd build && ../configure \
        $(gcc_flags) $(gcc_kernel_flags) $(gcc_libc_flags) $(gcc_target_flags) \
        $(gcc$(1)_flags) $(gcc$(1)_kernel_flags) $(gcc$(1)_libc_flags) $(gcc$(1)_target_flags)
>   $(Q)$(call cd_pkg,gcc) && cd build && $(make_j) $(3)
    # GCC insists on multilib directory names for some targets even when
    # multilib is disabled. Work around that. See also the similar glibc hack.
    #
    # TODO: Find a better way to disable multilib paths.
>   $(Q)$(call cd_pkg,gcc) && cd build/$(target) && \
        $(FIND) -type f \( -name Makefile -or -name '*.py' -or -name '*.la*' \) \
            -exec $(SED) 's%$(sysroot)/usr/lib/\.\./lib..*%$(sysroot)/usr/lib%g' '{}' -i \;
>   $(Q)$(call cd_pkg,gcc) && cd build/$(target) && \
        $(FIND) -type f -name Makefile \
            -exec $(SED) 's%\(MULTI\(OS\)\{0,1\}DIR\) := .*%\1 := \.%g' '{}' -i \;
>   $(Q)$(call cd_pkg,gcc) && cd build && $(make_j) $(4)
endef

# These are required for stage-1 GCC to build.
gcc1_flags += --with-newlib
gcc1_flags += --disable-shared
gcc1_flags += --disable-threads

# These are just to cut down on build times.
gcc1_flags += --disable-analyzer
gcc1_flags += --disable-gcov
gcc1_flags += --enable-languages=c,c++
gcc1_flags += --disable-nls
gcc1_flags += --disable-plugin

# Build stage-1 GCC so we can build libc.
$(eval $(call build_gcc,1,binutils,all-gcc all-target-libgcc,install-gcc install-target-libgcc))

gcc2_flags += --enable-languages=c,c++,jit
gcc2_flags += --enable-host-shared

# Build stage-2 GCC which supports libc.
$(eval $(call build_gcc,2,libc,,install))
