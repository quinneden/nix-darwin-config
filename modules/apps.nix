{ pkgs, ... }: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    # For details, see https://github.com/mas-cli/mas 
    # masApps = {
    #   Xcode = 497799835;
    # };

    taps = [
      { name = "homebrew/core"; }

      # { name = "homebrew/cask"; }

      { name = "homebrew/services"; }
    ];

    brews = [
      "aria2"
      "bat"
      "bison"
      "cask"
      "chroma"
      "cmake"
      "curl"
      "cython"
      "eza"
      "fd"
      "flex"
      "fzf"
      "gcc"
      "gdk-pixbuf"
      "gh"
      "git"
      "go"
      "gobject-introspection"
      "imagemagick"
      "jq"
      "just"
      "ldid"
      "lftp"
      "libimobiledevice"
      "llvm"
      "lzip"
      "m-cli"
      "meson"
      "micro"
      "mingw-w64"
      "node"
      "openssh"
      "openssl@3"
      "perl"
      "pipenv"
      "pipx"
      "pygments"
      "python@3.10"
      "qemu"
      "ripgrep"
      "rsync"
      "rust"
      "rustup-init"
      "sevenzip"
      "shellcheck"
      "wget"
      # "yabai"
    ];

    casks = [
      "docker"
      "gdisk"
      "iterm2"
      "macfuse"
      "utm"
      "vscodium"
    ];
  };
}
