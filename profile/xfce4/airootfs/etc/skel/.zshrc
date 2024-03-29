#
# ~/.zshrc
#

# script that runs before
# neofetch
random_script_runner

# Created by newuser for 5.9
eval "$(starship init zsh)"

# ZSH history file
HISTSIZE=900000000
SAVEHIST=900000000
HISTFILE=~/.zsh_history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
autoload bashcompinit
bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose false
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt autocd # change directory just by typing its name
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# configure key keybindings
bindkey -e                                     # emacs key bindings
bindkey ' ' magic-space                        # do history expansion on space
bindkey '^U' backward-kill-line                # ctrl + U
bindkey '^[[3;5~' kill-word                    # ctrl + Supr
bindkey '^[[3~' delete-char                    # delete
bindkey '^[[1;5C' forward-word                 # ctrl + ->
bindkey '^[[1;5D' backward-word                # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history # page up
bindkey '^[[6~' end-of-buffer-or-history       # page down
bindkey '^[[H' beginning-of-line               # home
bindkey '^[[F' end-of-line                     # end
bindkey '^[[Z' undo                            # shift + tab undo last action

# User configuration
# Source
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Path
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin:$HOME/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Example aliases

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -e /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if ((zshcache_time < paccache_time)); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# Alias;
# File Management:
alias cp="cp -iv" # confirm before overwriting something
alias rm="rm -iv"
alias mv="mv -iv"
alias df="df -h" # human-readable sizes
alias du="du -h"
alias cat="bat --style header --style snip --style changes --style header"
alias copy='xclip -sel clip <'

# Directory Operations:
alias cd..="cd ../"
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# System Info:
alias free="free -h"

# Listing Files:
# alias ll="ls -al"
# alias la="ls --color=auto"
# alias ls="ls --color=auto"
# alias sl="ls --color=auto"
# alias l="ls -ahls --color=auto"
alias la='eza -al --group-directories-first --icons --color=always'
alias ls='eza -l --group-directories-first --icons --color=always'
alias l='eza -l --group-directories-first --icons --color=always'
alias ll='eza -al --group-directories-first --icons --color=always'
alias lt='eza -aT --group-directories-first --icons --color=always'
alias l.='eza -ald --group-directories-first --icons .* --color=always'

# Text Editors:
alias vim="vim"
alias svim='sudo vim'

# File Browsing:
alias files="ranger"

# Network Operations:
alias curl="curl --user-agent 'noleak'"
alias wget="wget -c --user-agent 'noleak'"

# Disk Management:
alias shred="shred -zf"

# DOS Commands:
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

# Searching and Filtering:
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Version Control (Git):
alias g="git"
alias gst="git status"
alias gc="git commit -m "
alias ga="git add"
alias gpl="git pull"
alias gpom="git pull origin master"
alias gpu="git push"
alias gpuom="git push origin master"
alias gd="git diff"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gac="git add . && git commit -m"
alias grs="git restore --staged ."
alias gre="git restore"
alias gr="git remote"
alias gcl="git clone"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gt="git ls-tree -r master --name-only"
alias grm="git remote"
alias gb="git branch"
alias gf="git fetch"

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Dotfiles Management (Assuming a specific directory setup):
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfa='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias dfc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit'
alias dfp='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push'

# Pacman Shortcuts
alias sync="sudo pacman -Syyy"
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu; yay -Syu"
alias search="sudo pacman -Ss"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias clr-cache="yes | sudo pacman -Scc"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -Rns"
alias clr-pkg="sudo pacman -R $(pacman -Qdtq)"

# Miscellaneous:
alias c="clear"
alias q="exit"

# Application
# alias code="codium" # vscodium

# Working directory:
alias work="cd ~/Data-Linux/work"
alias data="cd ~/Data-Linux/"
# alias gh="cd ~/desktop/work/github"
# alias gl="cd ~/desktop/work/gitlab"

alias update='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upall='sudo pacman -Syyu; yay -Syu'
alias upal='sudo pacman -Syyu; yay -Syu'

alias updatemirror='sudo reflector -f 10 --download-timeout 25 -l 10 -a 10 -p https --sort rate --save /etc/pacman.d/mirrorlist'

alias cleancache='yes | yay -Scc'

alias poeweroff='sudo poeweroff'
alias reboot='sudo reboot'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Color for exa
export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# Display ISO version and distribution information in short
alias version="sed -n 1p /etc/os-release && sed -n 12p /etc/os-release && sed -n 13p /etc/os-release"

# Functions
# Function to extract various types of archives
ex() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) tar xf $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

netinfo() {
  # Display network interface information
  echo "---------- Network Interfaces ----------"
  ip -brief link show

  # Display IP address information
  echo "---------- IP Addresses ----------"
  ip -brief addr show

  # Display DNS settings
  echo "---------- DNS Settings ----------"
  grep nameserver /etc/resolv.conf

  # Display network connections
  echo "---------- Network Connections ----------"
  ss -tunap

  Display firewall settings
  echo "---------- Firewall Settings ----------"
  sudo iptables -L -v

  echo "----------"
}

whatsmyip() {
  echo "Fetching your external IP address..."
  external_ip=$(curl -s https://api64.ipify.org?format=text)
  if [ -n "$external_ip" ]; then
    echo "Your external IP address is: $external_ip"
  else
    echo "Unable to retrieve external IP address."
  fi
}

