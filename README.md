# nix with GCS repro

This builds nix with GCS support (enabling debug support in google-cloud-cpp)

## Usage
Clone this into an environment with Nix installed, either by
[installing it on your existing system](https://nixos.org/nix/), using a Docker
container with Nix available, or with a NixOS VM.

Run `nix-shell` to build the specified version of `nix`. Make sure you're
using the right version by comparing `which nix` from inside and outside the
`nix-shell`.

## Files
### default.nix
Entrypoint. imports a pinned version of nixpkgs with our custom overlay, and
describes a shell containing our custom version of Nix.

### google-cloud-cpp.nix
Contains the build recipe for google-cloud-cpp (Currently 0.14.0). If you want
to apply custom patches on top of that, either point src to somewhere else, or
set `patches`.

### nix.nix
Contains the build recipe for Nix itself, changing the existing one to point to
the code at https://github.com/NixOS/nix/pull/3021 instead, and adds
google-cloud-cpp.nix from above as a dependency.

### nixpkgs.nix
Provides a pinned tarball of nixpkgs, to freeze other packages. Imported from
default.nix.

### overlay.nix
Overrides nix to our custom version. Is passed while calling `nixpkgs` from
`nixpkgs.nix` in `default.nix`
