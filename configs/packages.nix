# System packages
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs wget git htop swaybg xfce.thunar xfce.thunar-volman gvfs
    waybar fuzzel kitty pavucontrol playerctl firefox fastfetch
    brightnessctl swaylock lxappearance nwg-look materia-theme
    papirus-icon-theme bibata-cursors xwayland-satellite tageditor
    avizo swayimg peazip libsForQt5.qtstyleplugin-kvantum ffmpeg
    libsForQt5.qt5ct materia-kde-theme qbittorrent strawberry lutris-free
    protonup-qt mako mpv unrar python313 kdePackages.kolourpaint
    localsend
  ];
}
