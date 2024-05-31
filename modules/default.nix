{ pkgs, ... }:

{
  imports = [
    ./system.nix
    ./brew.nix
    # ./builder.nix
  ];
}
