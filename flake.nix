{

description = "Home Manager and NixOS configurations of pyrotelekinetic";

inputs = {
  nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    ref = "nixos-23.05";
  };
  home-manager = {
    type = "github";
    owner = "nix-community";
    repo = "home-manager";
    ref = "release-23.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  pyroscheme = {
    type = "github";
    owner = "pyrotelekinetic";
    repo = "pyroscheme";
    ref = "main";
  };
};

outputs = { self, nixpkgs, home-manager, pyroscheme }@inputs: let
  mkSystem = import ./mkSystem.nix inputs;
in {
  nixosConfigurations = (
    mkSystem {
      host = "sol";
      system = "x86_64-linux";
    }
  ) // (
    mkSystem {
      host = "vega";
      system = "x86_64-linux";
    }
  );
};

}
