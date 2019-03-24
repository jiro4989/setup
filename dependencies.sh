#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository --yes ppa:ansible/ansible-2.7
sudo apt-get install ansible -y
sudo apt-get upgrade
