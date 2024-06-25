# Kruco

This is a makefile that simplifies the creation of [GCC](https://gcc.gnu.org)
cross-toolchains for a wide variety of target platforms.

The toolchains produced by this makefile are *probably* not appropriate for
building production software. The point of this makefile is just to be able to
type a single command and have a toolchain that is useful for development and
testing purposes in less than 15 minutes.

## Caveats

* This makefile is only tested regularly on modern Linux machines. It *might*
  work in other Unix-like environments, but we make no promises.
* The versions for Linux kernel headers, [glibc](https://sourceware.org/glibc),
  and [musl](https://musl.libc.org) are generally pinned to whatever the latest
  release of [Zig](https://ziglang.org) supports.
* You need to install various build prerequisites yourself, including some
  libraries. The build is done in this way to reduce the size of the generated
  toolchains.

## Usage

In a nutshell, usage is as follows:

1. Clone this repository.
2. Run `make list` to get a list of supported targets.
3. Run `make <target> PREFIX=...` to build and install a toolchain.
4. Run `make clean` to remove leftover build artifacts.

For example, `make arm-linux-gnueabi PREFIX=$HOME/cross` will install a
toolchain targeting Linux and glibc under `$HOME/cross/arm-linux-gnueabi` with a
sysroot under `$HOME/cross/arm-linux-gnueabi/sysroot`.

If you need to use your computer as an expensive space heater and/or you have a
burning hatred for your CPU and disk drive, you can run `make all` to build a
toolchain for every single supported target. That is 400+ toolchains, just to be
clear. You probably should not do that. But you *can*.

## Configuration

The following variables affect the makefile:

* `PREFIX`: The location to install the built toolchain in. Note that the
  toolchain will actually be installed under `$PREFIX/<target>`. Defaults to the
  `out` directory in the root of the repository.
* `BUILD`: The platform that you are building the toolchain on. This defaults to
  `x86_64-cross-linux-gnu`. The `cross` vendor component is crucial here, as it
  forces Autotools to run in cross-compilation mode. You only need to set this
  if you are building on a different platform, e.g. `aarch64-cross-linux-gnu`.
* `JOBS`: The maximum number of concurrent jobs that will be used while building
  each software package. Defaults to the output of `nproc`, i.e. as many jobs as
  you have CPU cores.
* `V`: Can be set to any value to get verbose output from the makefile.

## License

The build system is licensed under the terms found in
[`LICENSE-0BSD`](LICENSE-0BSD). Each software package that is built has its own
license terms.
