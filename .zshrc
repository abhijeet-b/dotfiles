source ~/.profile

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jeet/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Aliases
#alias wttr="curl wttr.in"
alias el="exa -l"

# Plugins - no manager for this one
source ~/.zsh-plugins/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
source ~/.zsh-plugins/copy-pasta/copy-pasta.plugin.zsh
source ~/.zsh-plugins/zsh-plugin-reload/zsh-plugin-reload.plugin.zsh
source ~/.zsh-plugins/up.zsh/up.plugin.zsh
# source ~/.zsh-plugins/ssh-connect/ssh-connect.sh

# Modifier settings
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_BLANK_LINES=1
