# SPDX-License-Identifier: 0BSD

# Disable some slow and/or unhelpful features.
MAKEFLAGS += -R -r --warn-undefined-variables

# Avoid shell portability issues.
SHELL = bash
.SHELLFLAGS = -e -o pipefail -u -c

# Avoid the need for tabs.
.RECIPEPREFIX = >

# We parallelize package builds, but our makefiles should be serial.
.NOTPARALLEL:

# Tools used throughout our makefiles.
FIND ?= find
MKDIR ?= mkdir
NPROC ?= nproc
RM ?= rm
SED ?= sed
XARGS ?= xargs

# How many jobs should we use in package builds?
JOBS ?= $(shell $(NPROC))

# Only echo commands if requested by the user with the V variable.
ifdef V
    Q =
else
    Q = @
endif
