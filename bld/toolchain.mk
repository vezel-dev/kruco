# SPDX-License-Identifier: 0BSD

include common.mk

ifndef PREFIX
    PREFIX := $(abspath $(dir $(firstword $(MAKEFILE_LIST)))/..)/out

    $(warning PREFIX variable not set; defaulting to $(PREFIX))
endif

# This is needed to convince Autotools that, yes, we do actually want to build a
# cross-compiler even though we are (probably) running on an x86_64 machine.
# Without this, x86_64-pc-linux-gnu is detected as the build machine triple,
# while x86_64-linux-gnu as the target triple gets normalized to that as well,
# so they compare equal.
#
# The downside of this hack is that BUILD needs to be set manually by the user
# if building on some other kind of machine.
#
# TODO: Figure out a better solution?
ifndef BUILD
    BUILD := x86_64-cross-linux-gnu

    $(warning BUILD variable not set; defaulting to $(BUILD))
endif

basename = $(basename $(notdir $(firstword $(MAKEFILE_LIST))))

build = $(BUILD)

# For the vast majority of toolchains, the program prefix and target triple are
# identical. But for architectures with a high degree of customizability, we use
# a toolchain name that does not match the target triple. For example, the
# riscv64imac-linux-gnu toolchain uses riscv64-linux-gnu as the target triple.
#
# This setup is necessary because Autoconf's config.sub only recognizes the
# riscv32 and riscv64 machine types without any ISA extension letters.
ifdef target
    toolchain = $(basename)
else
    target = $(basename)
    toolchain = $(target)
endif

prefix = $(abspath $(PREFIX)/$(toolchain))
sysroot = $(prefix)/sysroot

ifeq ($(findstring -linux-,$(target)),-linux-)
    kernel = linux
else
    kernel = freestanding
endif

ifeq ($(findstring -gnu,$(target)),-gnu)
    libc = glibc
else
    ifeq ($(findstring -musl,$(target)),-musl)
        libc = musl
    else
        libc = newlib
    endif
endif

# Set any additional build flags that may be required for the target.
-include kernel/$(kernel)/flags.mk
-include libc/$(libc)/flags.mk

# $(1) = package
cd_pkg = cd ../pkg/$(1)

# Some binutils makefiles for some reason invoke the user's shell while also
# using syntax that is incompatible with non-standard shells (e.g. fish). So
# explicitly set SHELL to work around this.
make_j = SHELL=bash MAKEFLAGS= $(MAKE) -j $(JOBS)

.PHONY: build*
build: build-gcc2
    # Clean up Libtool files because Autotools is silly.
>   $(Q)$(FIND) $(prefix) -type f -name '*.la' -delete

include kernel/$(kernel).mk
include libc/$(libc).mk
include tools/binutils.mk
include tools/gcc.mk
