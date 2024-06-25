# SPDX-License-Identifier: 0BSD

build-kernel:
>   $(Q)$(call cd_pkg,linux) && $(RM) -f -r build
>   $(Q)$(call cd_pkg,linux) && $(make_j) headers_install \
        O=build \
        ARCH=$(arch) \
        INSTALL_HDR_PATH=$(sysroot)/usr
