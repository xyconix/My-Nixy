{config, pkgs, ...}:
{
imports = [
  ./hardware-configuration.nix
  ./config/modulesSystem/system.nix
  ./config/modulesSystem/dekstop.nix
  ./config/modulesApps/dev.nix
  ./config/modulesSystem/services.nix
  ./config/modulesApps/apps.nix
  ./config/modulesApps/zsh.nix
  ./config/modulesSystem/users.nix
  ./config/modulesSystem/virtualization.nix
  ./config/modulesSystem/hyprland.nix
];
  system.stateVersion = "25.11";
}
