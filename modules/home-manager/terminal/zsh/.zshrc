# case insensitive autocompletion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'
zstyle ':completion:*' menu yes select

zmodload zsh/complist
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

bindkey -v
bindkey '^R' history-incremental-search-backward

alias cd="z"
alias zz="z -"
alias ls="eza"
alias tree="eza --tree"
alias cat="bat --paging=never"
alias fzf="fzf --height 40% --preview 'bat --color=always --style=numbers --line-range=:500 {}' | tee >(pbcopy)"
alias trash="rip"

alias nix-test="sudo nixos-rebuild test --flake ~/.config/nixos-config#default"
alias nix-switch="sudo nixos-rebuild switch --flake ~/.config/nixos-config#default"
