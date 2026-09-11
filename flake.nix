{
  description = "Phoenix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      hook = pkgs.writeShellScript "phoenix-hook" ''
        IFS= read -r FLAG < /root/flag.txt
        printf 'PHOENIX_FLAG=%s\n' "$FLAG"
      '';
    in {
      packages.${system}.default = hook;
    };
}