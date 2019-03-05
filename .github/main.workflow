workflow "Example" {
  on = "push"
  resolves = ["cmccandless/github-action-python/3.7-alpine@master"]
}

action "cmccandless/github-action-python/3.7-alpine@master" {
  uses = "cmccandless/github-action-python/3.7-alpine@master"
  args = "python -c 'print(\"Hello, World!\")'"
}
