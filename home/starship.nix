{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    preset = "pure-preset";
    settings = {
      directory.substitutions = {
        "~" = "homedir";
        "darwin" = " Darwin";
      };
      cmd_duration = {
        disabled = true;
      };
      git_branch = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
    };
  };
}