{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # 🌐 Apps kamu
    firefox
    kitty
    fastfetch
    vim
    spotify
    heroic
    discord
    telegram-desktop
    zoom-us
    obs-studio
    keepassxc
    ente-auth
    brave
    mpv
    ncdu
    whatsapp-electron

    # 🧠 Qt (KDE / QML support)
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtwebsockets

    # 🎬 WAJIB: multimedia backend
    qt6.qtmultimedia
    ffmpeg-full

    # 🎞️ GStreamer (backup backend biar nggak blank)
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad

    # 🐍 Python (buat plugin yang butuh websocket)
    (python3.withPackages (ps: with ps; [
      websockets
    ]))
  ];
}
