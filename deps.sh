#!/bin/bash

if [ "$(grep "ID=" /etc/os-release | cut -d "=" -f 2)" = manjaro ]; then
  set -eu

  # https://z1000s.hatenablog.com/entry/2017/11/16/223557
  # saitekika
  sudo pacman-mirrors -f 0

  # https://qiita.com/MoriokaReimen/items/dbe1448ce6c0f80a6ac1
  # apt update
  # sync repository
  sudo pacman -Syy
  # search software
  pacman -Ss ansible
  # install
  sudo pacman -S --noconfirm ansible
else
  set -eu

  sudo apt-get update
  sudo apt-get install software-properties-common
  sudo add-apt-repository --yes ppa:ansible/ansible-2.7
  sudo apt-get install ansible -y
  sudo apt-get upgrade
fi

