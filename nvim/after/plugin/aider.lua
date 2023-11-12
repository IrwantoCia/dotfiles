require('aider').setup({
  auto_manage_context = true,
  default_bindings = true
})

-- set a keybinding for the AiderOpen function
-- vim.api.nvim_set_keymap('n', '<leader>oa', '<cmd>lua AiderOpen("aider --auto-commits=0 --dark-mode=1", "vsplit")<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bo', ':lua AiderOpen("--dark-mode")<CR>', {noremap = true, silent = true})
