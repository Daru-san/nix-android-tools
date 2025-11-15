{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          dumpyara = pkgs.callPackage ./dumpyara.nix { };
          aospdtgen = pkgs.callPackage ./aospdtgen.nix { };
        };
      }
    );
}
