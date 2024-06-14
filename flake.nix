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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # # Optional: Declarative tap management
    # homebrew-core = {
    #   url = "github:homebrew/homebrew-core";
    #   flake = false;
    # };
    # homebrew-cask = {
    #   url = "github:homebrew/homebrew-cask";
    #   flake = false;
    # };
  };
  
  outputs = inputs @ {
  self,
  nix-darwin,
  nixpkgs,
  alejandra,
  home-manager,
  darwin-custom-icons,
  nix-homebrew,
  # homebrew-core,
  # homebrew-cask,
  ... }: let
    system = "aarch64-darwin";
    username = "quinn";
    hostname = "qmac";
    pkgs = nixpkgs.legacyPackages."${system}";
    specialArgs = { inherit username hostname system inputs; };
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
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
            environment.systemPackages = [ alejandra.defaultPackage.aarch64-darwin ];
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
