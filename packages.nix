{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix firefox kitty rofi git wget python3 playerctl ffmpeg
    waybar papirus-icon-theme orchis-theme fastfetch nwg-look eza
    pavucontrol nemo hypridle brightnessctl grim slurp swappy
    xwayland-satellite wlogout materia-kde-theme mpv losslesscut
    libsForQt5.qt5ct swayimg hyfetch bibata-cursors wayfreeze btop
    appimage-run heroic protonup-qt libnotify swaynotificationcenter 
    wf-recorder ferdium cliphist awww fzf wl-clipboard hyprpicker 
    imagemagick unzip unrar swaybg upscayl fd bat flowblade lolcat 
    cowsay mpc ymuse yazi tesseract
  ];
}
