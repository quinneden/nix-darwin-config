{ pkgs, ... }:

{
  imports = [
    ./builder.nix
    ./system.nix
    ./apps.nix
    ./yabai.nix
  ];
}
