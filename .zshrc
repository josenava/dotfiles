source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jose/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# # jose custom config
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLINE_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLINE_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_DISABLE_RPROMPT=true

plugins=(
	git
	zsh-syntax-highlighting
	pip
	python
	docker
	npm
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
