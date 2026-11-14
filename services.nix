{ config, lib, ... }:

{
  services = {
    syncthing = {
      enable = true;
      user = "omori";
      openDefaultPorts = true;
      dataDir = "/home/omori/Sync";
      configDir = "/home/omori/.config/syncthing";
    };
    gvfs.enable = true;
    printing.enable = true;
    qbittorrent = {
      enable = true;
      user = "omori";
    };
    blueman.enable = true;
    joycond.enable = true;
    tumbler.enable = true;
  };

  programs = {
    hyprlock.enable = true;
    localsend.enable = true;
    kdeconnect.enable = true;
    steam.enable = true;
  };
}
