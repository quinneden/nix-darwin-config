{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        directory = {
          style = "bold fg:117";
        };

        directory.substitutions = {
          "~" = "homedir";
        };

        format = "\$username\$hostname\$directory\$git_branch\$git_state\$git_status\$cmd_duration\$line_break\$python\$character";

        cmd_duration = {
          disabled = true;
        };

        git_branch = {
          format = "[ $branch]($style)";
          symbol = "";
          style = "fg:221";
        };

        nix_shell = {
          symbol = " ";
        };

        character = {
          success_symbol = "[❯](bold fg:48)";
          error_symbol = "[❯](bold fg:197)";
          vimcmd_symbol = "[❮](bold green)";
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

        # palette = "catppuccin_mocha";
      }
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d23"; # Replace with the latest commit hash
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          }
          + /palettes/mocha.toml));
  };
}
