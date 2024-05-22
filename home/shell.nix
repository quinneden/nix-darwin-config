
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
      ZSH="''$HOME/.oh-my-zsh"
      zstyle ':omz:update' mode auto
      zstyle ':omz:update' frequency 13
      '';
    };

    shellAliases = {
      "alx.builds" = "curl https://fedora-asahi-remix.org/builds | EXPERT=1 sh";
      "alx.dev" = "curl https://raw.githubusercontent.com/AsahiLinux/asahi-installer/main/scripts/bootstrap-dev.sh | EXPERT=1 sh";
      "alx.sh" = "curl https://alx.sh | sh";
      cdflake = "cd $DARWIN_CONFIG_DIR";
      code = "/Applications/VSCodium.app/Contents/Resources/app/bin/codium";
      codium = "/Applications/VSCodium.app/Contents/Resources/app/bin/codium";
      colortable = "/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/gawin/bash-colors-256/master/colors)";
      darwin-switch = "darwin-rebuild switch --flake $DARWIN_CONFIG_DIR#mothermini";
      fuck = "sudo rm -rf";
      l = "eza -a --icons --group-directories-first";
      la = "eza -glah";
      lar = "eza -aT -L2";
      ll = "eza -glAh";
      ls = "eza";
      lsblk = "diskutil list";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      nix-shell = "nix-shell --run zsh";
      py = "python";
      reboot = "sudo reboot";
      rf = "rm -rf";
      shutdown = "sudo shutdown -h now";
      surf = "sudo rm -rf";
      tree = "eza -aT";
      zconfig = "micro ~/.config/darwin/home/shell.nix";
    };

    initExtra = ''
    export DARWIN_CONFIG_DIR=''$HOME/.config/darwin

    export LANG=en_US.UTF-8

    export MICRO_TRUECOLOR=1
    
    export EDITOR="micro"

    export ZSCRIPTS=''$HOME/.scripts/zsh/scripts

    export HOMEBREW_PREFIX="/opt/homebrew"
    
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"

    export HOMEBREW_REPOSITORY="/opt/homebrew"

    export MANPATH="/opt/homebrew/share/man''${MANPATH+:''$MANPATH}:"

    export INFOPATH="/opt/homebrew/share/info:''${INFOPATH:-}"

    export PATH="''$PATH
    :/usr/local/bin\
    :/Users/quinn/.local/bin\
    :/Library/Frameworks/Python.framework/Versions/3.12/bin\
    :/run/current-system/sw/bin\
    :/opt/homebrew/bin\
    :/opt/homebrew/sbin"
    
    for f (~/.scripts/zsh/*(N.)) . ''$f

    test -e /Users/quinn/.iterm2_shell_integration.zsh && source /Users/quinn/.iterm2_shell_integration.zsh || true
    '';
  };
}
