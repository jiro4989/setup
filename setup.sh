#!/bin/bash

set -eu

./deps.sh
LANG=C xdg-user-dirs-gtk-update
ansible-playbook site_ubuntu.yaml -K
