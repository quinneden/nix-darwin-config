{ pkgs, ... }:

{
  imports = [
    # ./builder.nix
    ./system.nix
    ./brew.nix
    # ./yabai.nix
  ];
}
