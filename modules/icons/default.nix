{ 
inputs,
nix-darwin-icons,
flake,
pkgs,
...
}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "${flake}";
        icon = ./flake-dir.icns;
      }
    ];
  };
}
