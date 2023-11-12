local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>pq', builtin.quickfix, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>0', function ()
    builtin.treesitter({
        ignore_symbols = {"import", "parameter"},
        show_line = false
    })
end)

vim.keymap.set('n', '<leader>e', extensions.recent_files.pick, {})
