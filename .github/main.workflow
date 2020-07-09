workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@bc78180"]
}

action "re-actors/ansible-molecule-action@bc78180" {
  uses = "re-actors/ansible-molecule-action@bc78180"
  args = "--debug test"
  env = {
    ANSIBLE_ASYNC_DIR = "/tmp/ansible/async"
  }
}
