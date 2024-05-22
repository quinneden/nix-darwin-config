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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
    username = "quinn";
    hostname = "mothermini";
    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mothermini
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [
       ./modules/configuration.nix
       ./modules/system.nix

      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users.${username} = import ./home;
        home-manager.backupFileExtension = "backup";
      }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
