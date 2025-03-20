
M = {}

M.replacer = {
  {
      '<leader>h',
      function() require('replacer').run() end,
      desc = "run replacer.nvim"
  }
}

M.buf_lsp = function(_, buffer)
  local map = vim.keymap.set
  map("n", "<localleader>D", vim.lsp.buf.declaration, { silent = true, buffer = buffer, desc = "Declaration" })
  map("n", "<localleader>d", vim.lsp.buf.definition, { silent = true, buffer = buffer, desc = "Definition" })
end

M.init = function()
  local map = vim.keymap.set
  map("n", "<leader>p", '"*p', { silent = true, desc = "Paste from mouse" })
  map("n", "<leader>P", '"*P', { silent = true, desc = "Paste before from mouse" })

  local telescope_builtin = require('telescope.builtin')
  map("n", "<localleader>ff", telescope_builtin.find_files, { desc = 'Telescope find files' })
  map("n", "<localleader>fg", telescope_builtin.live_grep, { desc = 'Telescope live grep' })
  map("n", "<localleader>fb", telescope_builtin.buffers, { desc = 'Telescope buffers' })
  map("n", "<localleader>fh", telescope_builtin.help_tags, { desc = 'Telescope help tags' })
end

return M
