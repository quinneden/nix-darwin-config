{ username, ... }:

{
  imports = [
    ./vscodium.nix
    ./shell.nix
    ./starship.nix
    ./misc.nix
    ./scripts
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
