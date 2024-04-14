#!/bin/sh
cp settings/serverSettings.nix ./settings.nix
nix-build '<nixpkgs/nixos>' -I nixos-config=settings/isoSettings.nix --dry-run && echo "Test passed !" && rm ./settings.nix;
