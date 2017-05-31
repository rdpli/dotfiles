
holidays() {
  gcal -q ${1:-CA_QU} -n
}

we() {
  vim $(which "$@")
}

# ldf -- last downloaded file
ldf() {
  local file=~/Downloads/$(ls -1t ~/Downloads/ | head -n1)
  read -p "confirm: $file "
  mv "$file" .
}

wb() {
  vim "workbook.$1"
}

implode() {
  local target=$PWD
  cd ..
  read -p "delete $target "
  rm -rf $target
}

,s() {
  pwd
  git status --short --branch
}

