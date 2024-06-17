{
  pkgs,
  hostname,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      custom = "/Users/quinn/.oh-my-zsh/custom";
      plugins = ["zsh-navigation-tools nix-zsh-completions"];
      extraConfig = ''
        zstyle ':omz:update' mode auto
        zstyle ':omz:update' frequency 13
      '';
    };
    shellAliases = {
      "alx.builds" = "curl https://fedora-asahi-remix.org/builds | EXPERT=1 sh";
      "alx.dev" = "curl https://raw.githubusercontent.com/AsahiLinux/asahi-installer/main/scripts/bootstrap-dev.sh | EXPERT=1 sh";
      "alx.sh" = "curl https://alx.sh | EXPERT=1 sh";
      cdflake = "cd $DARWIN";
      code = "codium";
      darwin-switch = "darwin-rebuild switch --flake $DARWIN#${hostname}";
      fuck = "sudo rm -rf";
      l = "eza -la --icons --group-directories-first";
      ll = "eza -glAh";
      ls = "eza";
      lsblk = "diskutil list";
      nix-clean = "sudo nix store gc && nix store gc && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm -rf /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      push = "git push";
      py = "python";
      reboot = "sudo reboot";
      rf = "rm -rf";
      shutdown = "sudo shutdown -h now";
      surf = "sudo rm -rf";
      tree = "eza -aT";
      lsudo = "lima sudo";
    };
    sessionVariables = {
      ZSH = "/Users/quinn/.oh-my-zsh";
      DARWIN = "/Users/quinn/Darwin";
      LANG = "en_US.UTF-8";
      MICRO_TRUECOLOR = "1";
      BAT_THEME = "Dracula";
      EZA_ICON_SPACING = "2";
      EDITOR = "micro";
      SD = "/Users/quinn/.scripts/zsh/";
      PATH = "/Library/Frameworks/Python.framework/Versions/Current/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/Users/quinn/.local/bin:/run/current-system/sw/bin:/opt/podman/bin:/run/current-system/etc/profiles/per-user/quinn/bin:$PATH";
      HOMEBREW_PREFIX = "/opt/homebrew";
      HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
      HOMEBREW_REPOSITORY = "/opt/homebrew/Library/.homebrew-is-managed-by-nix";
      MANPATH = "/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
      INFOPATH = "/opt/homebrew/share/info:${INFOPATH:-}";
    };
    initExtraFirst = ''
      test -e $HOME/.cargo/env && . $HOME/.cargo/env || true
      for f (~/.scripts/zsh/*(N.)) . ''$f
      for f (~/.scripts/zsh/completions/*(N.)) . ''$f
      test -e /Users/quinn/.iterm2_shell_integration.zsh && source /Users/quinn/.iterm2_shell_integration.zsh || true
    '';
  };
}
