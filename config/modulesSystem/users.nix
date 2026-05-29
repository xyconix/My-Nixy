{ config, lib, pkgs, ... }:

{
  options.username = lib.mkOption {
    type = lib.types.str;
    default = "xyconix";
    description = "Username utama";
  };

  config.users.users.${config.username} = {
    isNormalUser = true;
    description = config.username;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
