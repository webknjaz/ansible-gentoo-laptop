ANSIBLE_TEST_PREFER_PODMAN=1

COMPUTED_PIPX_BIN_DIR=$(\
    pipx environment | \
    grep PIPX_BIN_DIR= | \
    tail -n 1 | \
    awk -F= '{print $2}' \
)
if [[ -n "${COMPUTED_PIPX_BIN_DIR}" ]]
then
    export PATH="${PATH}":"${COMPUTED_PIPX_BIN_DIR}"
fi

alias claude="${HOME}/.claude/local/claude"
