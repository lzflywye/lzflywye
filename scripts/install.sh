#!/bin/sh

if [ -z "$1" ]; then
  echo "$0 <binary>"
  exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
  echo "Escalating privileges..."
  exec sudo "$0" "$@"
fi

echo "Installing $1 to /usr/local/bin..."
install -t /usr/local/bin/ -o root -g root -m 755 "$1"
