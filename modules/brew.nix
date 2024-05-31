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
      # { name = "homebrew/core"; }
      { name = "homebrew/services"; }
      { name = "germag/podman-bootc"; }
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
      # "openssh"
      "openssl@3"
      "perl"
      "pipenv"
      "pipx"
      # "podman"
      "podman-bootc"
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

      ## Podman-bootc related
      # "podman-bootc" # brew tap germag/podman-bootc
      "xorriso"
      "libvirt"
      "golang"

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
