alias so='source $HOME/.bashrc && echo "Sourced bashrc."'
alias nv='nvim'

# Dotfiles Repo Management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias do:config='dotfiles config --local status.showUntrackedFiles no'
alias do:add='dotfiles add'
alias do:sync='dotfiles add -u'
alias do:co='dotfiles commit -m'
alias do:push='dotfiles push'
alias do:status='dotfiles status'

# Display Configs
alias disp='$HOME/.scripts/display-placer'
