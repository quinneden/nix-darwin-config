{ pkgs, ... }:

{
  nix.linux-builder = {
    enable = true;
    package = pkgs.darwin.linux-builder;
    systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
    protocol = "";
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
