inputs: { host, system }: with inputs; {

"${host}" = nixpkgs.lib.nixosSystem {
  system = system;
  modules = [
    ./mundus
    (self + "/mundus/" + host)
    {
      system.configurationRevision = self.rev or "DIRTY";
      networking.hostName = host;
      nix.registry.nixpkgs.flake = nixpkgs;
      environment.etc."nix/inputs/nixpkgs".source = nixpkgs.outPath;
      nix.nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
    }
    home-manager.nixosModules.home-manager {
      home-manager = {
        extraSpecialArgs = { colors = pyroscheme.colors; };
        useGlobalPkgs = true;
        useUserPackages = true;
        users.cison = {
          imports = [
            ./domus
            (self + "/domus/" + host)
          ];
        };
      };
    }
  ];
};

}
