#!/bin/bash

set -eu

readonly SCRIPT_NAME=$(basename $0)

main() {
  local os=$(tr '[:upper:]' '[:lower:]' <<< $1)
  shift
  case $os in
    ubuntu)
      readonly OS=Ubuntu
      setup_ubuntu $@
      ;;
    centos)
      readonly OS=CentOS
      setup_centos $@
      ;;
    manjaro)
      readonly OS=ManjaroLinux
      setup_manjaro $@
      ;;
    help)
      usage
      exit
      ;;
    *)
      exit 1
      ;;
  esac
}

usage() {
  cat << EOS
$SCRIPT_NAME はPCの環境を構築します。

Usage:
    $SCRIPT_NAME <command> [options]

Commands:
    help       このヘルプを出力する
    ubuntu     Ubuntu用のタスクを実行する
    centos     CentOS用のタスクを実行する
    manjaro    ManjaroLinux用のタスクを実行する

Options:
    -h --help         ヘルプを出力する
    -s --skip-deps    AnsiblePlaybookを実行するためのセットアップをスキップする
EOS
}

usage_ubuntu() {
  cat << EOS
$SCRIPT_NAME はPCの環境を構築します。

Usage:
    $SCRIPT_NAME <command> [options]

Commands:
    help       このヘルプを出力する
    ubuntu     Ubuntu用のタスクを実行する
    centos     CentOS用のタスクを実行する
    manjaro    ManjaroLinux用のタスクを実行する

Options:
    -h --help         ヘルプを出力する
    -s --skip-deps    AnsiblePlaybookを実行するためのセットアップをスキップする
EOS
}

setup_ubuntu() {
  set_opts $@
  local print_help=$print_help
  local skip_deps=$skip_deps

  if [ "$print_help" = true ]; then
    usage_ubuntu
    exit
  fi

  info "${OS}の環境構築を開始します。"

  if [ "$skip_deps" = false ]; then
    # リポジトリの最新科
    sudo apt-get update -y

    # Ansibleのインストール
    sudo apt-get install software-properties-common
    sudo add-apt-repository --yes ppa:ansible/ansible-2.7
    sudo apt-get install ansible -y

    # インストール済みパッケージの更新
    sudo apt-get upgrade -y
  fi

  # Ansible playbookの実行
  ansible-playbook site_ubuntu.yaml -K

  info "${OS}の環境構築を正常に完了しました。"
}

setup_centos() {
  set_opts $@
  local print_help=$print_help
  local skip_deps=$skip_deps

  info "${OS}の環境構築を開始します。"
  info "${OS}の環境構築を正常に完了しました。"
}

setup_manjaro() {
  set_opts $@
  local print_help=$print_help
  local skip_deps=$skip_deps

  info "${OS}の環境構築を開始します。"
  info "${OS}の環境構築を正常に完了しました。"
}

set_opts() {
  print_help=false
  skip_deps=false

  while (( 0 < $# )); do
    local opt=$1
    shift
    case $opt in
      -h|--help)
        print_help=true
        ;;
      -s|--skip-deps)
        skip_deps=true
        ;;
      *)
        err "不正なオプションです。 opt = $opt"
        exit 1
        ;;
    esac
  done
}

readonly RED="\x1b[31m"
readonly GREEN="\x1b[32m"
readonly RESET="\x1b[m"

info() {
  echo "[$GREEN info $RESET] $1" >&2
}

err() {
  echo "[$RED err $RESET] $1" >&2
}

main ${1+"$@"}
