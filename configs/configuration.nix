# My nixos configuration file.
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
    ];

  # Use the grub EFI boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "monster-nix"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "trq";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.omori = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Enable xdg portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  # Enable niri window manager
  programs.niri.enable = true;

  # Environment variables
  environment.sessionVariables = {
    EDITOR = "emacs";
    TERMINAL = "alacritty";
  };

  # List of installed fonts
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.droid-sans-mono
  ];

  # Enable "Kde Connect"
  programs.kdeconnect.enable = true;

  # Enable and configure zsh
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "bureau";
    };
  };

  # List services that you want to enable:
  services.flatpak.enable = true;
  services.syncthing = {
    enable = true;
    user = "omori";
    group = "wheel";
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.gvfs.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  
  system.stateVersion = "25.05"; # Do NOT change this!
}

