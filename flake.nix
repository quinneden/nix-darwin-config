{
  description = "Darwin system flake.";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-custom-icons = {
      url = "github:ryanccn/nix-darwin-custom-icons";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    lix = {
      url = "git+https://git.lix.systems/lix-project/lix?ref=refs/tags/2.90-beta.1";
      flake = false;
    };

    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module";
      inputs.lix.follows = "lix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    alejandra,
    home-manager,
    darwin-custom-icons,
    nix-homebrew,
    ...
  } @ inputs: let
    system = "aarch64-darwin";
    username = "quinn";
    hostname = "qmac";
    pkgs = import nixpkgs {
      config.allowUnfree = true;
    };
    specialArgs = {inherit username hostname system inputs;};
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs username hostname system;};
      modules = [
        (import ./configuration.nix)
        nix-homebrew.darwinModules.nix-homebrew
        darwin-custom-icons.darwinModules.default
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.${username} = import ./home;
            backupFileExtension = "backup";
          };
        }
        {
          environment.systemPackages = [alejandra.defaultPackage.aarch64-darwin];
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
