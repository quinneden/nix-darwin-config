{ pkgs, ... }:

{
  nix.linux-builder = {
      enable = true;
      systems = [ "aarch64-linux" ];
      protocol = "ssh-ng";
      maxJobs = 4;
  };
}