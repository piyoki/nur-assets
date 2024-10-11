{
  description = "My personal NUR assets repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      # lib = nixpkgs.lib;
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
    in
    (flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = (import nixpkgs) { inherit system; config.allowUnfree = true; };
      in
      {
        packages = {
          # assets
          wallpapers = pkgs.callPackage ./pkgs/wallpapers { };
          avatars = pkgs.callPackage ./pkgs/avatars { };
        };
      }));
}
