#!/usr/bin/env sh

install_bash_root() {
  local us="${1}"

  echo "Installing bash completion script"
  clever --bash-autocomplete-script "${us}" | sudo tee "/usr/share/bash-completion/completions/clever"
}

install_zsh_root() {
  local us="${1}"

  echo "Installing zsh completion script"
  clever --zsh-autocomplete-script "${us}" | sudo tee "/usr/share/zsh/site-functions/_clever"
}

install() {
  local us="$(which clever)"

  if which bash &>/dev/null; then
    install_bash_root "${us}"
  fi
  if which zsh &>/dev/null; then
    install_zsh_root "${us}"
  fi
}

install
