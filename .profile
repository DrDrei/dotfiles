alias so='source $HOME/.bashrc && echo "Sourcing profiles..."'
alias nv='nvim'

# Display Configs
alias disp='$HOME/.scripts/display-placer'

# Stitch all images together in current dir
alias convert:all="convert -append *.png out.png"

for FILE in ~/.config/zsh/*; do
    source $FILE
done
