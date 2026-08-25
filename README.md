***My NixOS Configuration***

---
...it's just my NixOS config files.
**WARNING: This process will replace your current configuration files. Ensure you have a backup before proceeding.**
To use these:
```
$ nix-shell -p git
$ sudo mv /etc/nixos /etc/nixos.bak
$ sudo git clone https://github.com/JustOMORI7/nixos /etc/nixos
$ sudo rm /etc/nixos/hardware-configuration.nix
$ sudo cp /etc/nixos.bak/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
$ sudo nixos-rebuild switch 
```
Done!

*Note: Review the `configuration.nix` file for any user-specific settings or usernames before running the rebuild command.*
