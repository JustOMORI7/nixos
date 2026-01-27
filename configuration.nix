# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
  ];
  
  # Use the GRUB EFI boot loader.
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use MONSTER drivers
  boot.extraModulePackages = [ config.boot.kernelPackages.tuxedo-keyboard ];
  boot.kernelModules = [ "tuxedo_keyboard" ];

  networking.hostName = "monster-nix"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "trq";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Configure X11
  services.xserver = {
    enable = true;
    xkb.layout = "tr";
    windowManager.openbox.enable = true;
  };

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.omori = {
    isNormalUser = true;
    extraGroups = [ "wheel" "syncthing" ]; # Enable ‘sudo’ for the user.
  };

  # Enable dynamically linked executables.
  programs.nix-ld.enable = true;

  # Enable XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # Set environment variables
  environment.variables = {
    EDITOR = "emacs";
  };

  # Install fonts
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.jetbrains-mono
  ];

  # Set qt theme
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };

  # F**k NVIDIA
   hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Enable and configure bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Configure firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8384 22000 2234 ];
    allowedUDPPorts = [ 21027 22000 2234 ]; 
  };

  system.stateVersion = "25.11"; # Do NOT change this!
}