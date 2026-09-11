#!/bin/sh
IFS= read -r FLAG < /root/flag.txt
printf 'PHOENIX_FLAG=%s\n' "$FLAG"