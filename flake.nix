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
  };

  outputs = inputs @ {
  self,
  nix-darwin,
  nixpkgs,
  alejandra,
  home-manager,
  darwin-custom-icons,
  ... }: let
    system = "aarch64-darwin";
    username = "quinn";
    hostname = "qmac";
    flake = "/Users/quinn/Darwin";
    # pkgs = nixpkgs.legacyPackages."${system}";
    specialArgs ={ inherit username hostname system flake inputs; };
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        {
          environment = {
            systemPackages = [ alejandra.defaultPackage.aarch64-darwin ];
          };
        }
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
      ];
    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
