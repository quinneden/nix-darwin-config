{
  inputs,
  nix-darwin-icons,
  pkgs,
  config,
  ...
}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = /Users/quinn/Darwin;
        icon = ./flake-dir.icns;
      }
    ];
  };
}
