{config, lib, pkgs, ...}:
let
    cfg = config.fndx.packages.i3;
in
with lib;
{
    options = {
        fndx.packages.i3.enable = mkEnableOption "i3 for Foundxtion";
    };

    config = mkIf cfg.enable {
        services.xserver = {
            displayManager = {
                autoLogin.enable = false;
                lightdm = {
                    background = config.fndx.graphical.background;
                    greeters.enso = {
                        enable = true;
                        blur = true;
                    };
                };
                defaultSession = "none+i3";
            };

            windowManager.i3 = {
                enable = true;
                package = pkgs.i3-gaps;
                extraPackages = with pkgs; [
                    spectacle
                    i3lock-fancy-rapid
		    light
		    blugon
                ];
                extraSessionCommands = ''
                  ${pkgs.feh}/bin/feh --bg-scale --fill ${config.fndx.graphical.background}
                '';
            };
        };

        fndx.packages.rofi.enable = true;
        fndx.packages.alacritty.enable = true;
        fndx.packages.picom.enable = true;
        fndx.packages.nautilus.enable = true;
    };
}
