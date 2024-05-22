{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # autosuggestion.enable = true;
    # syntaxHighlighting.enable = true;
    # oh-my-zsh = {
      # enable = true;
      # custom = "/Users/quinn/.oh-my-zsh";
      # plugins = [ "eza" "zsh-navigation-tools" ];
    # };
    shellAliases = {
      mi = "micro";
      py = "python";
      surf = "sudo rm -rf";
      rf = "rm -rf";
      nix-shell = "nix-shell --run zsh";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      commit = "git commit -a --allow-empty-message --no-edit";
    };
    initExtraFirst = ''
    export ZSH="$HOME/.oh-my-zsh"
    
    export DARWIN_CONFIG_DIR=$HOME/.config/darwin
    
    zstyle ':omz:update' mode auto      # update automatically without asking
    zstyle ':omz:update' frequency 13
    
    DISABLE_UNTRACKED_FILES_DIRTY="true"
    
    plugins=(colorize zsh-navigation-tools iterm2 zsh-syntax-highlighting zsh-autosuggestions)
    
    source $ZSH/oh-my-zsh.sh
    
    export LANG=en_US.UTF-8
    
    export EDITOR="micro"
    
    export ZSCRIPTS=$HOME/.oh-my-zsh/custom/scripts

    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export MANPATH="/opt/homebrew/share/man$\{MANPATH+:$MANPATH\}:";
    export INFOPATH="/opt/homebrew/share/info:$\{INFOPATH:-\}";
    
    for f (~/.oh-my-zsh/custom/scripts/*(N.)) . $f

    export MICRO_TRUECOLOR=1
    
    test -e /Users/quinn/.iterm2_shell_integration.zsh && source /Users/quinn/.iterm2_shell_integration.zsh || true
    
    export STARSHIP_CONFIG=~/.config/starship.toml
    eval "$(starship init zsh)"
    '';
  };

  # programs.zoxide = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
}
