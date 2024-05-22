{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
 
    settings = {
      directory.substitutions = {
        "~" = "homedir";
        "darwin" = " Darwin";
      };

      format = "\$username\$hostname\$directory\$git_branch\$git_state\$git_status\$cmd_duration\$line_break\$python\$character";
      
      cmd_duration = {
        disabled = true;
      };

      git_branch = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      directory = {
        style = "blue";
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_status = {
        format = "[[(*\$conflicted\$untracked\$modified\$staged\$renamed\$deleted)](218) (\$ahead_behind\$stashed)](\$style)";
        style = "cyan";
        conflicted = "";
        untracked = "";
        modified = "";
        staged = "";
        renamed = "";
        deleted = "";
        stashed = "≡";
      };

      python = {
        format = "[\$virtualenv](\$style) ";
        style = "bright-black";
      };
    };
  };
}