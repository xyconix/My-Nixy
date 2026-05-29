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

services.samba = {
  enable = true;
  openFirewall = true;
  
  settings = {
    global = {
      "workgroup" = "WORKGROUP";
      "server string" = "nixos-samba";
      "security" = "user";
    };
    share = {
      path = "/srv/share";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "no";
      "valid users" = "xyconix";
    };
  };
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

 networking.interfaces.wlp3s0.ipv4.addresses = [{
  address = "192.168.1.8";
  prefixLength = 24;
}];

networking.defaultGateway = "192.168.1.1";

 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;
 services.flatpak.enable = true;

}
