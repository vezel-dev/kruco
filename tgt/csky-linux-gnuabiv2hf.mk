# SPDX-License-Identifier: 0BSD

arch = csky

# TODO: Remove this if/when GCC starts recognizing gnuabiv2hf like Rust.
gcc_target_flags += --with-float=hard

include toolchain.mk
