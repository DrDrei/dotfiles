# https://stackoverflow.com/a/26020688
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
 
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# bun completions
[ -s "/Users/drei/.bun/_bun" ] && source "/Users/drei/.bun/_bun"
