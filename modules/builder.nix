{ pkgs, ... }:

{
  nix.linux-builder = {
    enable = false;
    package = pkgs.darwin.linux-builder;
    systems = [ "aarch64-linux" ];
    protocol = "ssh";
    maxJobs = 2;
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
  environment.etc."ssh/ssh_config.d/100-linux-builder.conf".text = ''
  Host linux-builder
    Hostname localhost
    HostKeyAlias linux-builder
    Port 2222
  '';
}
