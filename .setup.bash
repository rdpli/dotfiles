#!/bin/bash

flag="$@"

function relink() {
  ln -s -h -v $flag $2 $1
}

function lowercase(){
  echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``
KERNEL=`uname -r`
MACH=`uname -m`
DOTFILES=$(pwd)

cd

relink .inputrc      $DOTFILES/inputrc
relink .bash         $DOTFILES/bash
relink .bashrc       $DOTFILES/bashrc
relink .bash_profile $DOTFILES/bash_profile
relink .bash_logout  $DOTFILES/bash_logout

relink .vim          $DOTFILES/vim
relink .vimrc        $DOTFILES/vimrc

relink .gitconfig    $DOTFILES/gitconfig
relink .gitignore    $DOTFILES/gitignore

relink .screenrc     $DOTFILES/screenrc
relink .tmux.conf    $DOTFILES/tmux.conf

relink .irbrc        $DOTFILES/irbrc
relink .rdebugrc     $DOTFILES/rdebugrc
relink .rvmrc        $DOTFILES/rvmrc

relink .npmrc        $DOTFILES/npmrc
relink .jshintrc     $DOTFILES/jshintrc

relink .filter       $DOTFILES/filter

# This section assumes that Homebrew is already installed and that the
# Following fromulas are installed:
#  git
#  wget
#  tmux
#  coreutils
#  findutils
#  gawk
#  gnu-sed
#  gnu-tar


if [ "${OS}" == "darwin" ]; then

  BREWDIR="/usr/local/bin"
  TARGETDIR="/usr/local/bin"

  [ -e ${BREWDIR}/gls ] && relink ${TARGETDIR}/ls ${BREWDIR}/gls
  [ -e ${BREWDIR}/gdate ] && relink ${TARGETDIR}/date ${BREWDIR}/gdate
  [ -e ${BREWDIR}/gdu ] && relink ${TARGETDIR}/du ${BREWDIR}/gdu
  [ -e ${BREWDIR}/gseq ] && relink ${TARGETDIR}/seq ${BREWDIR}/gseq
  [ -e ${BREWDIR}/gshuf ] && relink ${TARGETDIR}/shuf ${BREWDIR}/gshuf
  [ -e ${BREWDIR}/gsort ] && relink ${TARGETDIR}/sort ${BREWDIR}/gsort
  [ -e ${BREWDIR}/gtac ] && relink ${TARGETDIR}/tac ${BREWDIR}/gtac
  [ -e ${BREWDIR}/gfind ] && relink ${TARGETDIR}/find ${BREWDIR}/gfind
  [ -e ${BREWDIR}/gawk ] && relink ${TARGETDIR}/awk ${BREWDIR}/gawk
  [ -e ${BREWDIR}/gsed ] && relink ${TARGETDIR}/sed ${BREWDIR}/gsed
  [ -e ${BREWDIR}/gtar ] && relink ${TARGETDIR}/tar ${BREWDIR}/gtar
fi

