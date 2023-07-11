successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAILED\033[0m] $1\n"
  echo ''
  exit
}


fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_file() {
  local file="$1"
  local text="$2"

  if [ "$file" = "$HOME/.zshrc" ]; then
    if [ -w "$HOME/.zshrc.local" ]; then
      file="$HOME/.zshrc.local"
    else
      file="$HOME/.zshrc"
    fi
  fi

  if ! grep -qs "^$text$" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

# useful for updating zshrc without duplicating entries
append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}
