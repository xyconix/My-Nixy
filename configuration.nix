{config, pkgs, ...}:
{
imports = [
  ./hardware-configuration.nix
  ./modules/system.nix
  ./modules/dekstop.nix
  ./modules/dev.nix
  ./modules/services.nix
  ./modules/virtualization.nix
  ./modules/apps.nix
  ./modules/zsh.nix
  ./modules/users.nix
];
  system.stateVersion = "25.11";
}
