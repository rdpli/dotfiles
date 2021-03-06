
go-types() {
  command rg '^type\b' -g \!*_test.go --no-heading
}

go-overview() {
  echo "$(fne go | wc -l) files, $(fne go | grep -c _test.go$) tests"
  echo "$(fne go | xargs cat | wc -l) lines"
  rg '^package main\b' -l | awk '!header {print "mains:"; header=1} {print "- " $0}'
}

go-get-bin() {
  GOPATH=$PWD go get -v "$1"
  cd bin || return
}

go-lintall() {
  golangci-lint run --enable-all -v "$@"
}

go-format-fix() {
  gofmt -w -s -d .
}

go-src() {
  cd "$(go env GOROOT)/src"
}

