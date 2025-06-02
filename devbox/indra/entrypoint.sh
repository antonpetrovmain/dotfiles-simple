#!/usr/bin/env bash
set -e

if [ ! -d "/home/ubuntu/dotfiles" ]; then
  sudo -u ubuntu git clone git@github.com:antonpetrovmain/dotfiles-simple.git /home/ubuntu/dotfiles
  sudo -u ubuntu git clone git@github.com:antonpetrovmain/notes.git     /home/ubuntu/notes

  chown -R ubuntu:ubuntu /home/ubuntu/dotfiles /home/ubuntu/notes
fi

# exec the container’s CMD
exec "$@"

