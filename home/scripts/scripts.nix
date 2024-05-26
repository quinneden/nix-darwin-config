{pkgs, ...}: let
  XXXXX = pkgs.writeShellScriptBin "XXXXX" (builtins.readFile ./scripts/XXXXX.sh);
in {
  home.packages = with pkgs; [
    XXXXX
  ];
}
