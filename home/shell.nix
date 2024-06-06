
{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      custom = "/Users/quinn/.oh-my-zsh/custom";
      plugins = [ "zsh-navigation-tools" ];
      extraConfig = ''
      ZSH="/Users/quinn/.oh-my-zsh"
      zstyle ':omz:update' mode auto
      zstyle ':omz:update' frequency 13
      '';
    };

    shellAliases = {
      "alx.builds" = "curl https://fedora-asahi-remix.org/builds | EXPERT=1 sh";
      "alx.dev" = "curl https://raw.githubusercontent.com/AsahiLinux/asahi-installer/main/scripts/bootstrap-dev.sh | EXPERT=1 sh";
      "alx.sh" = "curl https://alx.sh | EXPERT=1 sh";
      cdflake = "cd $DARWIN_CONFIG_DIR";
      code = "codium";
      darwin-switch = "darwin-rebuild switch --flake $DARWIN_CONFIG_DIR#mothermini";
      fuck = "sudo rm -rf";
      l = "eza -a --icons --group-directories-first";
      la = "eza -glah";
      lar = "eza -aT -L2";
      ll = "eza -glAh";
      ls = "eza";
      lsblk = "diskutil list";
      nix-clean = "sudo nix store gc && nix store gc && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm -rf /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      nix-shell = "nix-shell --run zsh";
      py = "python";
      reboot = "sudo reboot";
      rf = "rm -rf";
      shutdown = "sudo shutdown -h now";
      surf = "sudo rm -rf";
      tree = "eza -aT";
      lsudo = "lima sudo";
    };

    initExtra = ''

    export DARWIN_CONFIG_DIR=/Users/quinn/.config/darwin

    export GHCR_TOKEN=$(cat $HOME/.ghcr_token)

    export LANG=en_US.UTF-8

    export MICRO_TRUECOLOR=1
    
    export EDITOR="micro"

    export BAT_THEME="Dracula"

    export SCR=/Users/quinn/.scripts/zsh/

    export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/Users/quinn/.local/bin:/run/current-system/sw/bin:/opt/podman/bin:/run/current-system/etc/profiles/per-user/quinn/bin:$PATH"

    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew/Library/.homebrew-is-managed-by-nix";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
    
    for f (~/.scripts/zsh/*(N.)) . ''$f

    test -e /Users/quinn/.iterm2_shell_integration.zsh && source /Users/quinn/.iterm2_shell_integration.zsh || true
    '';
  };
}

    # export HOMEBREW_PREFIX="/opt/homebrew"
    
    # export HOMEBREW_CELLAR="/opt/homebrew/Cellar"

    # export HOMEBREW_REPOSITORY="/opt/homebrew"

    # export MANPATH="/opt/homebrew/share/man''${MANPATH+:''$MANPATH}:"

    # export INFOPATH="/opt/homebrew/share/info:''${INFOPATH:-}"
