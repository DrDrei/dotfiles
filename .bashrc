alias so='source $HOME/.bashrc && echo "Sourced bashrc."'
alias nv='nvim'

# Dotfile Repo Configurations
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles:config='dotfiles config --local status.showUntrackedFiles no'
alias do:add='dotfiles add'
alias do:sync='dotfiles add -u'
alias do:co='dotfiles commit -m'
alias do:push='dotfiles push'
alias do:status='dotfiles status'

