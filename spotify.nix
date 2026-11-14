{ config, pkgs, ... }:

let
  spicetify-nix = builtins.getFlake "github:Gerg-L/spicetify-nix";
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    spicetify-nix.nixosModules.default
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      spicyLyrics
      romajiConvert
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
