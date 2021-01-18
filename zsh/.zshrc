# load bundles using antigen:
source ~/.local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting  # load last if possible
antigen bundle zsh-users/zsh-history-substring-search  # load after syntax hl
antigen theme denysdovhan/spaceship-prompt
antigen apply

# bundle settings - zsh-autosuggestions:
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"

# bundle settings - spaceship-prompt - disable unused sections:
SPACESHIP_HG_SHOW="false"
SPACESHIP_PACKAGE_SHOW="false"
SPACESHIP_NODE_SHOW="false"
SPACESHIP_RUBY_SHOW="false"
SPACESHIP_ELM_SHOW="false"
SPACESHIP_ELIXIR_SHOW="false"
SPACESHIP_XCODE_SHOW_LOCAL="false"
SPACESHIP_SWIFT_SHOW_LOCAL="false"
SPACESHIP_GOLANG_SHOW="false"
SPACESHIP_PHP_SHOW="false"
SPACESHIP_RUST_SHOW="false"
SPACESHIP_HASKELL_SHOW="false"
SPACESHIP_JULIA_SHOW="false"
SPACESHIP_DOCKER_SHOW="false"
SPACESHIP_DOCKER_CONTEXT_SHOW="false"
SPACESHIP_AWS_SHOW="false"
SPACESHIP_GCLOUD_SHOW="false"
SPACESHIP_CONDA_SHOW="false"
SPACESHIP_PYENV_SHOW="false"
SPACESHIP_DOTNET_SHOW="false"
SPACESHIP_EMBER_SHOW="false"
SPACESHIP_KUBECTL_SHOW="false"
SPACESHIP_TERRAFORM_SHOW="false"

# bundle settings - spaceship-prompt:
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_DIR_TRUNC_REPO="false"
SPACESHIP_VI_MODE_COLOR="gray"
eval spaceship_vi_mode_enable

# history:
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.cache/zsh/history

# options:
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt CHASE_LINKS
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INTERACTIVE_COMMENTS
setopt LIST_AMBIGUOUS
setopt MENU_COMPLETE
setopt SHARE_HISTORY

# vi/nvim:
bindkey -v
export KEYTIMEOUT=1
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# keybindings:
bindkey '^ ' autosuggest-accept
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# fzf settings:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
  --preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) \
  || ([[ -d {} ]] && (tree -alCI '.git' {} | less)) || echo {} 2> /dev/null | head -50'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND="fdfind --type d --hidden --follow"
export FZF_ALT_C_OPTS="--preview 'tree -alCI '.git' {} | head -50'"

# aliases:
alias vi_on='spaceship_vi_mode_enable'
alias vi_off='spaceship_vi_mode_disable'
alias py38nvim='source $HOME/.venv/py38nvim/bin/activate'
alias wsensors='watch sensors -f'
alias fd='/usr/bin/fdfind'
alias bat='/usr/bin/batcat'
