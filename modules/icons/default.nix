{ 
inputs,
nix-darwin-icons,
pkgs,
...
}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Users/quinn/.config/darwin/";
        icon = ./icons/flake-dir.icns;
      }
    ];
  };
}
