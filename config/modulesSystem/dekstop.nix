{ config, pkgs, ... }:

let
  qylock = pkgs.stdenvNoCC.mkDerivation {
    pname = "qylock";
    version = "1.0";

    src = builtins.path {
      path = /etc/nixos/qylock/themes;
      name = "qylock-themes";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src/* $out/share/sddm/themes/
    '';
  };
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "pixel-hollowknight";

    extraPackages = with pkgs; [
      qylock
      qt6.qtmultimedia
      qt6.qt5compat
    ];
  };


  environment.systemPackages = [
    qylock
  ];

  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb.layout = "us";

  services.printing.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.pulseaudio.enable = false;

  environment.variables = {};
}
