{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  users.users.xyconix.extraGroups = [ "docker" ];

  nixpkgs.config = {
    android_sdk.accept_license = true;
  };

  environment.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk17}";
  };
}
