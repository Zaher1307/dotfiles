# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[white]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[white]%}%2~%{$fgte[white]%}]%{$reset_color%}$%b "
PS1="%{$fg[blue]%}%3~ %{$fg[blue]%}❭%{$reset_color%}%b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/zaher/.zshrc'

autoload -Uz compinit 
compinit

# End of lines added by compinstall
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="nvim"

#source zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

#source aliases
[[ -f .zsh_aliases ]] && source ~/.zsh_aliases
[[ -f .vi_mode ]] && source ~/.vi_mode
