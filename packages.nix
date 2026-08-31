{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix kitty rofi git wget python3 keepassxc playerctl ffmpeg
    waybar papirus-icon-theme orchis-theme fastfetch nwg-look eza
    pavucontrol nemo gvfs hypridle brightnessctl grim slurp swappy
    xwayland-satellite wlogout materia-kde-theme mpv losslesscut
    libsForQt5.qt5ct swayimg hyfetch bibata-cursors wayfreeze btop
    appimage-run localsend heroic protonup-qt qbittorrent libnotify
    swaynotificationcenter wf-recorder ferdium cliphist wlopm fd fzf
    wl-clipboard hyprpicker imagemagick unzip unrar swaybg upscayl
    flowblade lolcat cowsay mpc ymuse yazi tesseract bat
  ];
}
