alias so='source $HOME/.bashrc && echo "Sourced bashrc."'
alias nv='nvim'

# Dotfiles Repo Management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias do:nv='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim'
alias do:config='dotfiles config --local status.showUntrackedFiles no'
alias do:local='dotfiles config --local user.name "DrDrei" && git config --local user.email "9737270+DrDrei@users.noreply.github.com"'

# Display Configs
alias disp='$HOME/.scripts/display-placer'
