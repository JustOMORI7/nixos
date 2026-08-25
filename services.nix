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
    mpd = {
      enable = true;
      user = "omori";
      dataDir = "/home/omori/.local/share/mpd";
      settings = {
        music_directory = "/home/omori/Music";
        audio_output = [
          {
            type = "pipewire";
            name = "PipeWire Output";
          }
        ];
      };
    };
    mpdscribble = {
      enable = true;
      endpoints = {
        "last.fm" = {
          username = "JustOMORI7";
          passwordFile = "/home/omori/.config/mpdscribble/lastfm_pass";
        };
      };
    };
  };

  programs = {
    hyprlock.enable = true;
    localsend.enable = true;
    kdeconnect.enable = true;
    steam.enable = true;
    xfconf.enable = true;
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
