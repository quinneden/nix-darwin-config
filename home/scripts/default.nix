{pkgs, ...}: let
  sec = pkgs.writeShellScriptBin "sec" (builtins.readFile ./scripts/sec.sh);
in {
  home.packages = with pkgs; [
    sec
  ];
}
