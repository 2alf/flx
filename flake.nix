{
  description = "Phoenix";

  outputs = { self }: {
    packages.x86_64-linux.default =
      builtins.derivation {
        name = "flag";
        system = builtins.currentSystem;

        builder = "/bin/sh";

        args = [
          "-c"
          "printf '%s' \"$FLAG\" > \"$out\""
        ];

        FLAG = builtins.readFile /root/flag.txt;
      };
  };
}