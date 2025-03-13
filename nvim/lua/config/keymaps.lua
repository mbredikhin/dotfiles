M = {}

M.replacer = {
  {
    "<leader>rq",
    function()
      require("replacer").run()
    end,
    silent = true,
    desc = "Make quickfix editable for replacing in",
  },
}

M.buf_lsp = function(_, buffer)
  local map = vim.keymap.set
  map("n", "<localleader>D", vim.lsp.buf.declaration, { silent = true, buffer = buffer, desc = "Declaration" })
  map("n", "<localleader>d", vim.lsp.buf.definition, { silent = true, buffer = buffer, desc = "Definition" })
  -- etc
end

M.init = function()
  local map = vim.keymap.set
  map("n", "<leader>p", '"*p', { silent = true, desc = "Paste from mouse" })
  map("n", "<leader>P", '"*P', { silent = true, desc = "Paste before from mouse" })
end

return M
