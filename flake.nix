{

description = "Home Manager configuration of Carter";

inputs = {
  nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    ref = "nixos-22.11";
  };
  home-manager = {
    type = "github";
    owner = "nix-community";
    repo = "home-manager";
    ref = "release-22.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { nixpkgs, home-manager, ... }: {
  homeConfigurations.cison = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      config.allowUnfree = true;
      system = "x86_64-linux";
    };
    modules = [
      ./domus/home.nix
      ./domus/sway.nix
      ./domus/vim.nix
      ./domus/games.nix

      (args: {
        nix.registry.nixpkgs.flake = nixpkgs;
        xdg.configFile."nix/inputs/nixpkgs".source = nixpkgs.outPath;
        home.sessionVariables.NIX_PATH = "nixpkgs=${args.config.xdg.configHome}/nix/inputs/nixpkgs$\{NIX_PATH:+:$NIX_PATH}";
      })
    ];
  };
};

}
