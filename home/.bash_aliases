alias cat='batcat'
alias fd='fdfind'
alias gc='git commit -m'
alias gd="git diff -- ':!package-lock.json' ':!yarn.lock'"
alias upgrade='sudo apt update && sudo apt -y upgrade'

# Github actions script to show builds
alias act='~/dev/devvm/home/bin/actions $*'

# fzh - fuzzy search history
# See https://github.com/junegunn/fzf/wiki/examples#command-history
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fzh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

alias ls='ls -alGFh'
alias ll='ls -alGFh'
alias sl='ls'

# Run devvm in headless mode
alias devvm='VBoxHeadless -s devvm'

# Network
alias localip="ifconfig | grep 'inet ' | grep -v 127 | cut  -f 2 -d ' '"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ss='ss -tls'

alias jqtest="open https://jqplay.org/"

# Example saml2aws alias
#alias myprof='saml2aws login --profile myprof --role=arn:aws:iam::1234567890:role/developer --skip-prompt --session-duration=43200'

alias vi='nvim'

alias t='tree -afA -I ".git|.idea|.node_modules" $*'

alias ghv='gh repo view -w'

