# System packages
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs wget git htop swaybg xfce.thunar xfce.thunar-volman gvfs
    waybar fuzzel alacritty pavucontrol playerctl brave audacious
    brightnessctl swaylock lxappearance nwg-look materia-theme
    papirus-icon-theme bibata-cursors xwayland-satellite tageditor
    avizo
  ];
}
