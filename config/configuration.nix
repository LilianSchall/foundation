{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./boot
    ./network
  ];

}
