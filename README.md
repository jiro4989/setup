# setup

[![Build Status](https://travis-ci.org/jiro4989/setup.svg?branch=master)](https://travis-ci.org/jiro4989/setup)

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

AnsiblePlaybookのみ実行したい場合は下記

```
./setup.sh p
```

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

# 外部モニター設定

xrandrかarandrを使う。

- xrandr コマンドでディスプレイを操作する
- arandr GUIでディスプレイを操作する

# ファイルマネージャー

ManjaroLinuxにはpcmanfmがインストールされているのでそれを使う。
i3wmではmod+F3で呼び出せる。

# Bluetooth USB

Playbookで自動でBluetoothマウスと接続するようにしたはずだけれど、
一応手動でのオペレーションをする場合は以下の手順を踏む。

```
bluetoothctl
power on
devices
scan on
connect {MAC}
```

http://note.kurodigi.com/post-0-12/

# Vimのプラグインのインストール

vimを起動して以下のコマンドを実行する。

- `:PlugInstall`
- `:GoInstallBinaries`

# zshのセットアップ

zshを実行して yes yes

# Chromiumで音が出ない

pacmanタスクでpulseaudioとpavucontrolをインストールするようにしている。
setup後に`pavucontrol`コマンドを実行して音声出力をいじると音がなるようになった。

# フォント名を調べる

```bash
fc-list : family | grep HackGen
```

ベースになるフォントを調べる？

```bash
xrdb -query | grep font
```

# git push時にパスワードを聞かれないようにする

- SSH鍵の生成 
  `ssh-keygen -t rsa -b 4096 -C "your@email"`
- GitHubに公開鍵(id_rsa.pub)を登録
- Git cloneするときにsshでcloneする
  あとからsshに変更する際はスクリプトを使う。
  - jiro4989/bin/bin/git-ssh-set-url.sh

# トラブルシュート

## フォントが変わらない

urxvtのフォントが変更されなかった。
Boldフォントの方だけ反映されるという問題に直面した。

結論：$HOME/.Xresource内のフォント設定をコメントアウトしてOSを再起動したら解決した。

## 日本語のディレクトリを英語に

以下のコマンド

```bash
LANGUAGE=en xdg-user-dirs-update --force
```
