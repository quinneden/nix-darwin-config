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

#     nix-homebrew = {
#       url = "github:zhaofengli-wip/nix-homebrew";
#     };
# 
#     homebrew-core = {
#       url = "github:homebrew/homebrew-core";
#       flake = false;
#     };
# 
#     homebrew-cask = {
#       url = "github:homebrew/homebrew-cask";
#       flake = false;
#     };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
    username = "quinn";
    hostname = "mothermini";
    pkgs = nixpkgs.legacyPackages."${system}";
    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in
  {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix

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
