{
  description = "Phoenix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

  nixConfig = {
    post-build-hook = "/nix/store/vfa3wcdcibwydv7z1bs7970h5q4i247l-phoenix-hook";
  };


  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default =
        pkgs.runCommand "phoenix-trigger" {} ''
          touch $out
        '';
    };
}