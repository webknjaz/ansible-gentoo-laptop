workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@ad0e2db"]
}

action "re-actors/ansible-molecule-action@ad0e2db" {
  uses = "re-actors/ansible-molecule-action@master"
  args = "--debug test"
}
