# SPDX-License-Identifier: 0BSD

include bld/common.mk

packages = $(sort $(foreach package,$(wildcard pkg/*),$(notdir $(package))))
targets = $(sort $(foreach target,$(wildcard tgt/*.mk),$(basename $(notdir $(target)))))

.PHONY: list
list:
>   $(Q)echo "Supported targets:"
>   $(Q)echo
>   $(Q)for target in $(targets); do echo "    $$target"; done
>   $(Q)echo
>   $(Q)echo "Run 'make <target> PREFIX=...' to build and install a toolchain."

# $(1) = target
define build_toolchain
.PHONY: $(1)
$(1):
>   $(Q)$(MAKE) clean
>   $(Q)$(MAKE) -C tgt -f $(1).mk -I ../bld
endef

$(foreach target,$(targets),$(eval $(call build_toolchain,$(target))))

.PHONY: all
all: $(targets)

# $(1) = package
define clean_package
.PHONY: clean-$(1)
clean-$(1):
>   $(Q)echo "Cleaning $(1)..."
>   $(Q)cd pkg/$(1) && $(RM) -f -r build
endef

$(foreach package,$(packages),$(eval $(call clean_package,$(package))))

.PHONY: clean
clean: $(foreach package,$(packages),clean-$(package))
