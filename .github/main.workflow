workflow "Roles testing workflow" {
  on = "push"
  resolves = ["re-actors/ansible-molecule-action@300d248"]
}

action "re-actors/ansible-molecule-action@300d248" {
  uses = "re-actors/ansible-molecule-action@300d248"
  args = "--debug test"
  env = {
    ANSIBLE_ASYNC_DIR = "/tmp/ansible/async"
  }
}
