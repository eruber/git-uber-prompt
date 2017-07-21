#!/bin/bash
echo "Deploying posh-git-prompt.sh..."
cp posh-git-prompt.sh $USERPROFILE/posh-git-prompt.sh
echo "Deploying .bash_aliases..."
cp .bash_aliases $USERPROFILE/.bash_aliases
echo "Sourcing ~/.bashrc..."
source $USERPROFILE/.bashrc
