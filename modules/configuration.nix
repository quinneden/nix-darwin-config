
{ pkgs, lib, username, ... }:

{
  users.users.quinn = {
    home = "/Users/quinn";
    description = "quinn";
  };

  programs.zsh.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = false; # https://github.com/NixOS/nix/issues/7273
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@admin" ];
    };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 4d";
    };
  };

  services.nix-daemon.enable = true;
  
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
