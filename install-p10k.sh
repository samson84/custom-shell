#! /bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

if [[ ! -f ~/.p10k.zsh ]]; 
then
  echo "Copying ${SCRIPT_DIR}/.p10k.zsh config to homedir"
  cp ${SCRIPT_DIR}/.p10k.zsh ~
else
  echo "~/.p10k.zsh is exists. Delete or rename them to use this one."
fi
