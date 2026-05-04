{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> {
    system = pkgs.system;
    config.allowUnfree = true;
  };

  flutterLinuxDeps = with pkgs; [
    gtk3
    glib
    pango
    cairo
    gdk-pixbuf
    libepoxy
    libxkbcommon
    wayland
    xorg.libX11
1
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libXext
  ];
in
{
  environment.systemPackages = with pkgs; [
    git curl wget unzip
    neovim lazygit
    tmux ripgrep fd jq gh direnv vscode cmake

    nodejs nodejs_22 nodePackages.npm yarn bun

    android-tools

    ninja pkg-config gtk3 clang jdk17
    glib pango cairo gdk-pixbuf libGL libepoxy libxkbcommon wayland
    xorg.libX11 xorg.libXcursor xorg.libXrandr xorg.libXi xorg.libXext

    python3 python3Packages.pip python3Packages.virtualenv
    rustc cargo
    php phpPackages.composer
    dbeaver-bin
    godot_4
    kicad
  ];

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      glib
      libgcc

      # ⬇️ Tambahin ini biar Flutter aman
      libGL
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXtst
    ];
  };
}
