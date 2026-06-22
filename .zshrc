# Enable colors and change prompt: autoload -U colors && colors 
# PS1="%B%{$fg[blue]%}[%{$fg[red]%}%n%{$fg[black]%}@%{$fg[white]%}%M %{$fg[white]%}%2~%{$fgte[white]%}]%{$reset_color%}$%b "
# Prompt
PS1="%F{#ee960e} %~ %f%F{#ee960e}➜%f "

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

# typewritten config

# End of lines added by compinstall
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="nvim"
export VISUAL="nvim"
export PDFVIEWER="okular"
export GOPATH="$HOME/.go"
export OPENCODEPATH="$HOME/.opencode"
export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$OPENCODEPATH/bin:$PATH"
export TERMINAL="kitty"

#source zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh

#source aliases
[[ -f $HOME/.zsh/.zsh_aliases ]] && source ~/.zsh/.zsh_aliases
[[ -f $HOME/.zsh/.vi_mode ]] && source ~/.zsh/.vi_mode
[[ -f $HOME/.zsh/.zprofile ]] && source ~/.zsh/.zprofile

function tl() {
	session="$(find -L $HOME/.tmuxp -type f | rev | cut -d"/" -f 1 | rev | cut -d"." -f 1 | fzf -i --height=50% --layout=reverse)"
	[[ -n "$session" ]] && tmuxp load -y "$session"
}

function tk() {
  selection=$(tmux ls | awk -F: '{print $1}' | fzf -i --height=50% --layout=reverse)
  [ -z "$selection" ] && return
  echo -e "\n" | tmuxp freeze --quiet --yes --force -o ~/.tmuxp/"$selection".yaml "$selection"
  tmux kill-session -t "$selection"
}

function cfg() {
  file=$(find $HOME/.dotfiles -name "*" -type f | fzf -i)
  [[ -n "$file" ]] && nvim "$file"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/zaher/.google-cloud-sdk/path.zsh.inc' ]; then . '/home/zaher/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/zaher/.google-cloud-sdk/completion.zsh.inc' ]; then . '/home/zaher/.google-cloud-sdk/completion.zsh.inc'; fi
