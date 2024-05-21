{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "eza" "zsh-navigation-tools" ];
    };
    shellAliases = {
      mi = "micro";
      py = "python";
      surf = "sudo rm -rf";
      rf = "rm -rf";
      l = "eza --icons  -a --group-directories-first";
      la = "eza -a1 --";
      ll = "eza --icons  -a --group-directories-first --long --git";
      tree = "eza --icons --tree --group-directories-first";
      nix-shell = "nix-shell --run zsh";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      commit = "git commit -a --allow-empty-message --no-edit";
    };

    # plugins = [
    # {
    #   name = "";
    #   file = "share/zsh/$[PLUGIN]/$[PLUGIN].zsh";
    #   src = pkgs.$[PLUGIN];
    # }];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".zshrc".text = ''
    
  export DARWIN_CONFIG_DIR=$HOME/.config/darwin
  
  DISABLE_UNTRACKED_FILES_DIRTY="true"
  
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="nano"
  else
    export EDITOR="micro"
  fi
  
  export ZSCRIPTS=$HOME/.scripts/zsh
  
  for f (~/.scripts/zsh/*(N.)) . $f
  
  export MICRO_TRUECOLOR=1

  export NIX_REMOTE=daemon
  '';
}
