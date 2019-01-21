# Path to your oh-my-zsh installation.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH=/usr/share/oh-my-zsh/

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs virtualenv pyenv)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER="..."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
ZSH_THEME="powerlevel9k/powerlevel9k"

# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/home/jose/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	virtualenv
	pip
	python
	docker
	npm
	history
	virtualenvwrapper
)


neofetch

#alias
alias ls="ls --color"
alias l="ls -lhart"
alias gpull="git pull"
alias gpush="git push"
alias ga="git add"
alias gs="git status"
alias gcm="git commit -m"
alias dcup="docker-compose up -d"
alias dcdown="docker-compose down"
alias dcps="docker-compose ps"
alias update="yay -Syu"


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
