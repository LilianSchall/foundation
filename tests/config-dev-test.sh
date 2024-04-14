#!/bin/sh
cp settings/devSettings.nix ./settings.nix
cp tests/hardware-configuration.nix .;
nix-build '<nixpkgs/nixos>' -I nixos-config=configuration.nix --dry-run && echo "Test passed !" && rm settings.nix hardware-configuration.nix;

