workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@af4bb0c"]
}

action "re-actors/ansible-molecule-action@af4bb0c" {
  uses = "re-actors/ansible-molecule-action@af4bb0c"
  args = "--debug test"
  env = {
    ANSIBLE_ASYNC_DIR = "/tmp/ansible/async"
  }
}
