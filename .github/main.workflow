workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@dea467e"]
}

action "re-actors/ansible-molecule-action@dea467e" {
  uses = "re-actors/ansible-molecule-action@dea467e"
  args = "--debug test"
  env = {
    ANSIBLE_ASYNC_DIR = "/tmp/ansible/async"
  }
}
