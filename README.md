# setup

環境構築用のAnsible-Playbook

## 前提条件

- Ansible2

以下の公式インストール手順に従ってAnsibleをインストールする

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu

Ansible version

        % ansible --version
        ansible 2.7.7
          config file = None
          configured module search path = ['/home/jiro4989/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
          ansible python module location = /home/jiro4989/.local/lib/python3.6/site-packages/ansible
          executable location = /home/jiro4989/.local/bin/ansible
          python version = 3.6.7 (default, Oct 22 2018, 11:32:17) [GCC 8.2.0]

## 環境構築方法

以下のコマンドを実行する

```
./setup.sh
```

## フォント

- HackGen
- https://qiita.com/tawara_/items/374f3ca0a386fab8b305

## OSの再インストール

不定期にOSを再インストールするときにやること。

### USBにOSイメージを焼く

USBにOSイメージを焼くためにUSBのデバイス名を調べる。

```bash
sudo fdisk -l | grep /dev/sd
```

USBを初期化するときは以下のコマンド(結構時間がかかる)

```bash
sudo dd if=/dev/zero of=/dev/{デバイス名} bs=16MB

# sdbの時
sudo dd if=/dev/zero of=/dev/sdb bs=16MB
```

USBにISOをやく(結構時間がかかる)

```bash
sudo dd if={ISOファイル名}.iso of=/dev/{デバイス名} bs=16MB

# sdbのとき
sudo dd if={ISOファイル名}.iso of=/dev/sdb bs=16MB
```

# Display setting

```
xrandr -> Show display information
arandr -> Graphical display settings
PCmanFM -> File manager
```
/etc/sudoers (visudo)
Defaults timestamp_timeout = 600

# Bluetooth USB

bluetoothctl
power on
devices
scan on
devices
connect {MAC}

http://note.kurodigi.com/post-0-12/

# Vim setup

vim
:PlugInstall

# zsh

zsh
-> y
zsh
-> y

