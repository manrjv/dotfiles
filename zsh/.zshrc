# my settings:
setopt histignorealldups histsavenodups sharehistory
setopt correct_all
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
bindkey -v
export KEYTIMEOUT=1
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# load bundles using antigen:
source ~/.local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen theme denysdovhan/spaceship-prompt
antigen apply

# bundle settings:
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_DIR_TRUNC_REPO="false"
eval spaceship_vi_mode_enable

# keybindings:
bindkey '^ ' autosuggest-accept
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases:
alias vi_on='spaceship_vi_mode_enable'
alias vi_off='spaceship_vi_mode_disable'
alias py38nvim='source $HOME/.venv/py38nvim/bin/activate'
alias wsensors='watch sensors -f'
alias fd='/usr/bin/fdfind'
alias bat='/usr/bin/batcat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
  --preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) \
  || ([[ -d {} ]] && (tree -alCI '.git' {} | less)) || echo {} 2> /dev/null | head -50'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND="fdfind --type d --hidden --follow"
export FZF_ALT_C_OPTS="--preview 'tree -alCI '.git' {} | head -50'"
