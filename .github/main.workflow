workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@master"]
}

action "re-actors/ansible-molecule-action@master" {
  uses = "re-actors/ansible-molecule-action@master"
}
