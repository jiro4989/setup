#!/bin/bash

set -eu

./deps.sh
ansible-playbook site_manjarolinux.yaml -K
