# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Greeting
echo "Welcome to Parrot OS"

# Prompt
PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# alias
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history


##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;Parrot Terminal\a"
preexec () { print -Pn "\e]0;$1 - Parrot Terminal\a" }

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Custom Aliases
alias nv='nvim'
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias cat='bat'
alias catn='/usr/bin/cat'
alias catnl='bat --paging=never'

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Development paths
export PATH=$PATH:$HOME/.cargo/env
#export PATH="$HOME/.local/bin:$PATH"
export DOTNET_ROOT="/usr/share/dotnet"
export PATH="$PATH:/usr/share/dotnet"
export PATH="$PATH:/home/youngermaster/Flutter/flutter/bin"
export PATH="$PATH:/home/youngermaster/AndroidStudio/android-studio/bin"
export PATH="$PATH:/home/youngermaster/JetBrains/Rider/bin/"
#export PATH="$PATH:/home/youngermaster/AppImages"

# Android SDK Tools
export PATH="$PATH:/home/youngermaster/Android/Sdk/build-tools/32.0.0/"
export PATH="$PATH:/home/youngermaster/Android/Sdk/cmdline-tools/latest/bin/"
export ANDROID_SDK_ROOT=/home/youngermaster/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export JAVA_HOME=/home/youngermaster/jdk1.8.0_202

# Pomodoro Program PATH
export PATH="$PATH:/usr/share/pomodoro_cli/"

# Git config
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_youngermaster_github
ssh-add ~/.ssh/id_ed25519_youngermaster_gitlab
ssh-add ~/.ssh/id_rsa_jmyoung_getaclub
clear

# To avoid errors gray screens with IDEA IDEs or Android Studio
wmname LG3D

# Set keymaps to LATAM
setxkbmap -layout latam,es
# This function is taken from S4vitar's blog.
# https://s4vitar.github.io/bspwm-configuration-files/

# Extract nmap information
function extractPorts() {
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

function fping() {
    ping -R -c 1 $1
}

function mksd() {
	mkdir -p $1/EPT/tools $1/EPT/scope $1/EPT/scans $1/EPT/logs $1/EPT/evidence/screenshots  $1/EPT/evidence/data  $1/EPT/evidence/credentials
	mkdir -p $1/IPT/tools $1/IPT/scope $1/IPT/scans $1/IPT/logs $1/IPT/evidence/screenshots  $1/IPT/evidence/data  $1/IPT/evidence/credentials
}
# -p- searchs for all the ports (65535).
# --open searchs for all the open ports.
# -sS searchs over TCP, so we go a little bit faster.
# --min-rate 5000, we send packets no slower than 5000 per second, so we go a little bit faster.
# -vvv Gives us more info.
# -n We avoid to scan with DSN resolution.
# -Pn Doens't pings the target.
# -oG generates an output of the resulted scan.

function fpscan() {
    sudo nmap -p- --open -sS --min-rate 5000 -n -Pn $1 -oG allPorts
}
