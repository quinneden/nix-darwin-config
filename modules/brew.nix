{
  inputs,
  nix-homebrew,
  pkgs,
  ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "quinn";
    autoMigrate = true;
  };
}
