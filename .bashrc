alias so='source $HOME/.bashrc && echo "Sourced bashrc."'
alias nv='nvim'

# Dotfile Repo Configurations
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles:config='dotfiles config --local status.showUntrackedFiles no'
alias dot:add='dotfiles add -u'
alias dot:co='dotfiles commit -m'
alias dot:push='dotfiles push'
alias dot:status='dotfiles status'

