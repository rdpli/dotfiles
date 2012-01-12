
alias git_vimdiff="git difftool"

alias git_diff="git diff -w | vim -R -"

#-------------------------------------------------

alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(yellow)%d%Creset' --abbrev-commit --date=relative --all --date-order"

alias gln="git log --name-only"

#-------------------------------------------------

git_attach() {
  git remote add origin $1
  git push origin master
  git branch --set-upstream master origin/master
}

