{
  description = "Basic nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Nixvim
    nixvim.url = "github:WaterIris/IrisNixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        alduin = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "iris@alduin" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
