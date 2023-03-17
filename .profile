alias so='source $HOME/.bashrc && echo "Sourcing profiles..."'
alias nv='nvim'

# Display Configs
alias disp='$HOME/.scripts/display-placer'
alias disp:work='displayplacer "id:2810435A-5CDE-107D-F1B9-891EE475911B res:1920x1080 hz:60 color_depth:8 scaling:off origin:(0,0) degree:0" "id:AB86A851-16BC-41AD-CB00-34C406A5EE8A res:1920x1080 hz:60 color_depth:8 scaling:off origin:(1920,0) degree:0"'
alias disp:zoom='displayplacer "id:2810435A-5CDE-107D-F1B9-891EE475911B res:1920x1080 hz:60 color_depth:8 scali
ng:off origin:(0,0) degree:0" "id:FEC19417-0608-C1DF-AE93-05FFA5168526 res:1792x1120 hz:59 col
or_depth:4 scaling:on origin:(1040,1080) degree:0" "id:AB86A851-16BC-41AD-CB00-34C406A5EE8A re
s:1920x1080 hz:60 color_depth:8 scaling:off origin:(1920,0) degree:0"'

# Stitch all images together in current dir
alias convert:all="convert -append *.png out.png"

# kasa integration: https://github.com/python-kasa/python-kasa
setup-device() {
  kasa --host 192.168.0.1 wifi join $1
}

for FILE in ~/.config/zsh/*; do
    source $FILE
done

. "$HOME/.cargo/env"
