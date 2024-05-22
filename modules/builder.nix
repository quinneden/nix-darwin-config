{ pkgs, ... }:

{
  nix.linux-builder = {
    enable = false;
    systems = [ "aarch64-darwin" "aarch64-linux" ];
    protocol = "ssh-ng";
    maxJobs = 4;
    # config = ({ pkgs, lib, config, ... }:
    #   {
    #     users.users.builder = {
    #       isNormalUser = true;
    #       home = "/home/quinn";
    #       password = "cbro";
    #       extraGroups = [ "wheel" ];
    #     }; 
    #   });
  };
}
