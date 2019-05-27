#!/bin/bash

USE_PLAYBOOK_ONLY=false
if [ "$1" = p ] || [ "$1" = playbook ]; then
  USE_PLAYBOOK_ONLY=true
fi

if [ "$USE_PLAYBOOK_ONLY" = false ]; then
  ./deps.sh || { echo Failed deps.sh; exit 1; }
fi

if [ "$(grep "ID=" /etc/os-release | cut -d "=" -f 2)" = manjaro ]; then
  ansible-playbook site_manjarolinux.yaml -K || { echo Failed playbook; exit 1; }
else
  ansible-playbook site_ubuntu.yaml -K || { echo Failed playbook; exit 1; }
fi

