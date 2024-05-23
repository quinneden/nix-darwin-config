
{ pkgs, lib, username, ... }:

{
  imports = [
    ./modules
  ];

  users.users.quinn = {
    home = "/Users/quinn";
    description = "quinn";
  };

  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true; # https://github.com/NixOS/nix/issues/7273
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@admin" "root" ];
    };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 4d";
    };
  };

  services.nix-daemon.enable = true;
  
  networking.dns = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  system.stateVersion = 4;
}
