{
inputs,
nix-homebrew,
pkgs,
...
}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    # User owning the Homebrew prefix
    user = "quinn";
    # Automatically migrate existing Homebrew installations
    autoMigrate = true;
  };
}
