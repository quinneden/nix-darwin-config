{ pkgs, ... }: {

  homebrew = {
    enable = false;
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
      # { name = "homebrew/core"; }
      { name = "homebrew/services"; }
      # { name = "germag/podman-bootc"; }
    ];
    
    brews = [
      "aria2"
      "bat"
      "bison"
      "bzip2"
      "cask"
      "chroma"
      "cmake"
      "curl"
      "cython"
      "cmake"
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
      "golang"
      "imagemagick"
      "jq"
      "just"
      "ldid"
      "lftp"
      "libb2"
      "libimobiledevice"
      "libvirt"
      "lima"
      "llvm"
      "lzip"
      "lzo"
      "m-cli"
      "meson"
      "micro"
      "mingw-w64"
      "ninja"
      "node"
      "openssl@3"
      "perl"
      "pipenv"
      "pipx"
      "pkg-config"
      "pyenv"
      "pyenv-virtualenv"
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

    ];

    casks = [
      "docker"
      "gdisk"
      "iterm2"
      "macfuse"
      "podman-desktop"
      "utm"
      "vagrant"
      "vscodium"
    ];
  };
}
