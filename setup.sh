#!/bin/bash

set -eu

./deps.sh
ansible-playbook site_ubuntu.yaml -K
