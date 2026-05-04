{config,pkgs, ...}:
{
 networking.hostName = "nixos";
 networking.networkmanager.enable = true;
 time.timeZone = "Asia/Jakarta";
 i18n.defaultLocale = "en_US.UTF-8";

 #Flakes
 nix.settings.experimental-features =["nix-command" "flakes"];

 #Garbage Collection
 nix.gc = {
 automatic =true;
 dates = "weekly";
 options = "--delete-older-than 7d";
 };



 #Network Tuning
 networking.networkmanager.wifi.powersave =false;

 services.resolved.enable = true;
 networking.networkmanager.dns = "systemd-resolved";

 boot.kernel.sysctl = {
 "net.core.default_qdisc" = "fq";
 "net.ipv4.tcp_congestion_control" = "bbr";
 };

 nixpkgs.config.allowUnfree = true;


 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;
 services.flatpak.enable = true;

}
