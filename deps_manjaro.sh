#!/bin/bash

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
