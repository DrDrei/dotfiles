# Create and configure sshkey
# mkdir ~/.ssh && cd ~/.ssh && ssh-keygen
# touch config

# Host github.com
#	  HostName github.com
#	  User git
#	  IdentityFile ~/.ssh/id_github

# Test Connection
# ssh -T github.com

# Init Steps: ref -> https://www.atlassian.com/git/tutorials/dotfiles
# git clone --bare https://github.com/DrDrei/dotfiles $HOME/.dotfiles
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# dotfiles checkout
# dotfiles config --local status.showUntrackedFiles no
# git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local core.worktree $HOME
# git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --unset core.bare

# Dotfiles Repo Management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias do:nv='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim'
alias do:config='dotfiles config --local status.showUntrackedFiles no'
alias do:local='dotfiles config --local user.name "DrDrei" && git config --local user.email "9737270+DrDrei@users.noreply.github.com"'
