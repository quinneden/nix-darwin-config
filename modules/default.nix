{ pkgs, ... }:

{
  imports = [
    ./system.nix
    ./icons
    ./brew.nix
    # ./builder.nix
  ];
}
