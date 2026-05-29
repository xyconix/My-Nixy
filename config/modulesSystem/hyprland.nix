{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    waybar
    rofi
    wl-clipboard
    grim
    slurp
    brightnessctl
    playerctl
    pamixer
  ];

  security.polkit.enable = true;

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
