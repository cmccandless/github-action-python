workflow "Example" {
  on = "push"
  resolves = [
    "Python 2.7",
    "Python 3.4",
    "Python 3.5",
    "Python 3.6",
    "Python 3.7",
    "Python 3.8-rc",
    "Example using local action",
  ]
}

action "Python 2.7" {
  uses = "cmccandless/github-action-python/2.7@master"
  args = "python -c 'print(\"Hello, World!\")'"
}

action "Python 3.4" {
  uses = "cmccandless/github-action-python/3.4@master"
  args = "python -c 'print(\"Hello, World!\")'"
}

action "Python 3.5" {
  uses = "cmccandless/github-action-python/3.5@master"
  args = "python -c 'print(\"Hello, World!\")'"
}

action "Python 3.6" {
  uses = "cmccandless/github-action-python/3.6@master"
  args = "python -c 'print(\"Hello, World!\")'"
}

action "Python 3.7" {
  uses = "cmccandless/github-action-python/3.7@master"
  args = "python -c 'print(\"Hello, World!\")'"
  resolves = ["Local action"]
}

action "Python 3.8-rc" {
  uses = "cmccandless/github-action-python/3.8-rc@master"
  args = "python -c 'print(\"Hello, World!\")'"
}

action "Local action" {
  uses = "./3.7"
  needs = ["Python 3.7"]
  args = "python -c 'print(\"I am different\")'"
}
