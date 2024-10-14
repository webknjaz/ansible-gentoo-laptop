-- NOTE: Sometimes auto-folding gets enabled by accident.
-- NOTE: The fix is to toggle it with <z-i>.

vim.g.python3_host_prog = "python3"
vim.g.python3_host_prog = "/home/wk/.pyenv/versions/astronvim-pyenv-py3.11.5/bin/python3"

return {
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "go",
          "rust",
        },
        ignore_filetypes = {
          "python",
        },
      },
    },
  },
  -- ufo = {
  --   provider_selector = function(_, filetype, buftype)
  --     return {}
  --   end
  -- },
}
