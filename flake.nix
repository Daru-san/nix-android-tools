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
        packages = rec {
          dumpyara = pkgs.callPackage ./dumpyara.nix { inherit sebaubuntu_libs; };
          aospdtgen = pkgs.callPackage ./aospdtgen.nix { inherit sebaubuntu_libs; };
          sebaubuntu_libs = pkgs.callPackage ./sebaubuntu_libs.nix { };
          unpackbootimg = pkgs.callPackage ./unpackbootimg.nix { };
          twrpdtgen = pkgs.callPackage ./twrpdtgen.nix { inherit sebaubuntu_libs; };
          twrpdtgen_v2 = pkgs.callPackage ./twrpdtgen_v2.nix { inherit sebaubuntu_libs; };
          updater = pkgs.callPackage ./scripts/default.nix { };
        };
      }
    );
}
