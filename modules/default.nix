{ pkgs, ... }:

{
  imports = [
    ./builder.nix
    ./system.nix
  ];
}
