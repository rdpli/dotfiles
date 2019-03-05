
if [ -n "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

COLOR_RED=$(tput setaf 1)
ATTR_RESET=$(tput sgr0)

export PROMPT_COMMAND=set_prompt
set_prompt() {
  local exit=$?
  if [ "$exit" -ne 0 ]; then
    echo -e "${COLOR_RED}exit: ${exit}${ATTR_RESET}"
  fi
}

PS1='\[${PS1_COLOR}\]\h\[${ATTR_RESET}\] '

