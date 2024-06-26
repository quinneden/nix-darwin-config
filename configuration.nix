{
  pkgs,
  lib,
  nix-homebrew,
  inputs,
  username,
  ...
}: {
  imports = [./modules];

  users.users.quinn = {
    home = "/Users/quinn";
    # description = "quinn";
  };

  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["@admin" "root"];
      builders-use-substitutes = true;
      # substituters = ["https://cache.lix.systems"];
      # trusted-public-keys = ["cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="];
    };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 4d";
    };
  };

  services.nix-daemon.enable = true;

  networking.knownNetworkServices = ["Wi-Fi"];

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
