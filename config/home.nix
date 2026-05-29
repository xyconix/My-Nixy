{ pkgs, config, caelestia-shell, ... }:

{
  home.username = "xyconix";
  home.homeDirectory = "/home/xyconix";
  home.stateVersion = "25.11";

  imports = [ ];

  home.packages = [
    caelestia-shell.packages.${pkgs.system}.with-cli
  ];

  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;

      lang.python = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };

      lang.go = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
    };

    extraPackages = with pkgs; [
      nixd
      alejandra
    ];
  };
# }
