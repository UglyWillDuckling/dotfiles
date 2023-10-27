# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 2>/dev/null
fi

umask 002
setopt IGNORE_EOF

# GLOBBING
setopt EXTENDED_GLOB
setopt extended_glob
setopt KSH_GLOB

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.local/bin:$HOME/.nvm:$HOME/dev/scripts:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/dev/tools/dsutils:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/miniconda3/bin/:$PATH
export PATH=$HOME/dev/projects/notion-api/api/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 2>/dev/null
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=2
#
# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

 #set history size
export HISTSIZE=200000
#save history after logout
export SAVEHIST=500000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
# add timestamp for each entry
setopt EXTENDED_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # tmux
  z
  k
  chucknorris
  copypath
  web-search
  sudo
  zsh-autosuggestions
  compleat
  emoji
  zsh-syntax-highlighting
  dirhistory
  dotenv
  qrcode
)

source $ZSH/oh-my-zsh.sh

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

alias j="jobs"

# zsh coloring
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 2>/dev/null

# COLORS
export GREP_COLORS='ms=01;33:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

# Directory colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Bashmarks
source ~/.local/bin/bashmarks.sh

# Ruby
[ -x "$(command -v rbenv)" ] && eval "$(rbenv init -)"

# The !uck
if [ -x "$(command -v thefuck)" ]
then
    eval $(thefuck --alias)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### source the https://github.com/junegunn/fzf-git.sh script
source $HOME/dev/scripts/fzf-git.sh

_gen_fzf_default_opts() {
  local base03="#002b36"
  local base02="#073642"
  local base01="#586e75"
  local base00="#657b83"
  local base0="#839496"
  local base1="#93a1a1"
  local base2="#eee8d5"
  local base3="#fdf6e3"
  local yellow="#b58900"
  local orange="#cb4b16"
  local red="#dc322f"
  local magenta="#d33682"
  local violet="#6c71c4"
  local blue="#268bd2"
  local cyan="#2aa198"
  local green="#859900"

  # Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}
_gen_fzf_default_opts
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow'

# disable the ctrl+s shortcut
stty -ixon
# from https://superuser.com/a/767491
# Format the time command output to include memory usage
MAX_MEMORY_UNITS=MB

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

### INCLUDES
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_l ]; then
    . ~/.bash_aliases_l
fi

if [ -f ~/.zshrc_l ]; then
    . ~/.zshrc_l
fi

if [ -f ~/.zsh_start ]; then
    . ~/.zsh_start
fi
[ -f ~/.env ] && source ~/.env

# THIRD PARTY INIT
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vladimir/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vladimir/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vladimir/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vladimir/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "/home/vladimir/.ghcup/env" ] && source "/home/vladimir/.ghcup/env" # ghcup-env
