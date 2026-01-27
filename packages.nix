# Installed packages on this system
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git wget curl htop alacritty nwg-look picom libnotify
    thunar thunar-volman papirus-icon-theme materia-theme
    bibata-cursors rofi nitrogen tint2 brightnessctl lutris
    protonup-qt android-tools gemini-cli lsd antigravity
    where-is-my-sddm-theme pavucontrol floorp-bin obsidian
    rclone obconf nsxiv weather keepassxc deluge-gtk emacs
    dunst lxappearance claws-mail mpv alsa-utils strawberry
    materia-kde-theme localsend flameshot qt6Packages.qt6ct
    unzip unrar peazip wineWowPackages.full nicotine-plus
    openrgb
  ];
}
