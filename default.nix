builtins.derivation {
  name = "flag";
  system = builtins.currentSystem;
  builder = "/bin/sh";
  args = [
    "-c"
    "printf '%s' \"$FLAG\" > \"$out\""
  ];
  FLAG = builtins.readFile /root/flag.txt;
}