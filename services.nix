{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
      kdePackages.qt5compat
    ];
    theme = "where_is_my_sddm_theme";
    settings.General.InputMethod = "";
  };
  services.gvfs.enable = true;
  # services.zapret = {
  #   enable = true;
  #   params = [ "nfqws --dpi-desync=hostfakesplit --dpi-desync-ttl=3" ];
  # };
  services.flatpak.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "bureau";
    };
    shellAliases = {
      ls = "lsd";
      kys = "shutdown now";
      rebuild = "sudo nixos-rebuild switch";
    };
  };
  services.syncthing = {
    enable = true;
    user = "omori";
    configDir = "/home/omori/.config/syncthing";
    guiAddress = "127.0.0.1:8384";
  };
  services.deluge = {
    enable = true;
    user = "omori";
  };
  services.blueman.enable = true;
  services.logmein-hamachi.enable = true;
  programs.kdeconnect.enable = true;
  services.espanso.enable = true;
}