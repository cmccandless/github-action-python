workflow "Example" {
  on = "push"
  resolves = ["GitHub Action for Python 3.7"]
}

action "GitHub Action for Python 3.7" {
  uses = "cmccandless/github-action-python/3.7-alpine@master"
  args = "python -c 'print(\"Hello, World!\")'"
}
