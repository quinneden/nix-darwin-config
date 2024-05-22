
{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # oh-my-zsh = {
    #   enable = true;
    #   custom = "/Users/quinn/.oh-my-zsh";
    #   plugins = [ "eza" "zsh-navigation-tools" ];
    # };
    shellAliases = {
      py = "python";
      nix-shell = "nix-shell --run zsh";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      alx.builds = "curl https://fedora-asahi-remix.org/builds | EXPERT=1 sh";
      alx.sh = "sh <(curl https://alx.sh)";
      alx.dev = "sh <(curl https://raw.githubusercontent.com/AsahiLinux/asahi-installer/main/scripts/bootstrap-dev.sh)";
      cdflake = "cd $DARWIN_CONFIG_DIR";
      code = "/Applications/VSCodium.app/Contents/Resources/app/bin/codium";
      codium = "/Applications/VSCodium.app/Contents/Resources/app/bin/codium";
      colortable = "/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/gawin/bash-colors-256/master/colors)";
      darwin-switch = "darwin-rebuild switch --flake $DARWIN_CONFIG_DIR#mothermini";
      fuck = "sudo rm -rf";
      lar = "eza -aT -L2";
      ls = "eza";
      l = "eza -a --icons --group-directories-first";
      la = "eza -glah";
      ll = "eza -glAh";
      lsblk = "diskutil list";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      reboot = "sudo reboot";
      rf = "rm -rf";
      surf = "sudo rm -rf";
      shutdown = "sudo shutdown -h now";
      tree = "eza -aT";
      zconfig = "micro ~/.config/darwin/home/shell.nix";
    };
    initExtra = ''
    export PATH=''$HOME/bin:/usr/local/bin:''$HOME/.local/bin:''$PATH
    
    export DARWIN_CONFIG_DIR=''$HOME/.config/darwin
    
    DISABLE_UNTRACKED_FILES_DIRTY="true"
    
    export LANG=en_US.UTF-8
    
    if [[ -n ''$SSH_CONNECTION ]]; then
      export EDITOR="nano"
    else
      export EDITOR="micro"
    fi

    export ZSCRIPTS=''$HOME/.scripts/zsh/scripts

    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:''${PATH+:''$PATH}"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export MANPATH="/opt/homebrew/share/man''${MANPATH+:''$MANPATH}:"
    export INFOPATH="/opt/homebrew/share/info:''${INFOPATH:-}"

    export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:''${PATH}"

    export PATH="/run/current-system/sw/bin:''${PATH+:''$PATH}"
    
    export MICRO_TRUECOLOR=1

    ## Source extra customs.
    for f (~/.scripts/zsh/*(N.)) . ''$f

    test -e /Users/quinn/.iterm2_shell_integration.zsh && source /Users/quinn/.iterm2_shell_integration.zsh || true

    '';
  };
}
    # export STARSHIP_CONFIG=~/.config/starship.toml
    # eval "''$(starship init zsh)"
