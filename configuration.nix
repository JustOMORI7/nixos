# My NixOS Configuration. (chomusuke)

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./services.nix
    ./packages.nix
  ];

  # --- Use the GRUB boot loader --- #
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernel.sysctl = {
    "vm.dirty_background_bytes" = 33554432; # 32 mb
    "vm.dirty_bytes" = 67108864;            # 64 mb
  };

  # --- Allow unfree packages --- #
  nixpkgs.config.allowUnfree = true;

  # --- Kernel settings --- #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "hid-nintendo" "uinput" ];

  networking.hostName = "monster-nix";
  networking.networkmanager.enable = true;

  # --- Enable bluetooth --- #
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.uinput.enable = true;

  # --- Enable flakes and nix-command --- #
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- Set your time zone --- #
  time.timeZone = "Europe/Istanbul";

  # --- Select internationalisation properties --- #
  console = {
    font = "Lat2-Terminus16";
    keyMap = "tr";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # --- Enable sound --- #
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.omori = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # --- Run unpatched dynamic binaries on NixOS --- #
  programs.nix-ld.enable = true;

  # --- Configure Qt --- #
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };

  # --- Install fonts --- #
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
  ];

  # --- Enable Mango and SDDM --- #
  programs.mango.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "${pkgs.where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme";

    extraPackages = with pkgs; [
      where-is-my-sddm-theme
      kdePackages.qtdeclarative
      kdePackages.qt5compat
    ];
  };

  # --- Delete generations older than 3 days --- #
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # --- Enable Flatpak --- #
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [ "gtk" ];
    };
  };

  # --- Enable and configure zsh --- #
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "bira";
    };
    shellAliases = {
      ls = "eza --icons always";
      shx = "EDITOR=hx sudoedit";
      ytdl-opus = ''nix run github:NixOS/nixpkgs/nixos-unstable#yt-dlp -- -f "ba[acodec=opus]/ba" --extract-audio --audio-format opus --audio-quality 96k --embed-thumbnail --embed-metadata --ppa "ThumbnailsConvertor+ffmpeg:-vf crop=\'min(iw\,ih):min(iw\,ih)\'" -o "%(uploader)s - %(title)s.%(ext)s"'';
    };
  };

  # --- Environment variables --- #
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  }; 

  system.stateVersion = "26.05"; # Do NOT change this!
}

