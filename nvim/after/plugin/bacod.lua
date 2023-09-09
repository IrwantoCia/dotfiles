require"bacod".setup("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")
vim.keymap.set("n", "<leader>xs", "<cmd>lua require('bacod').call_gpt()<cr>")
vim.keymap.set("n", "<leader>xx", "<cmd>lua require('bacod').get_lines()<cr>")
vim.keymap.set("n", "<leader>sr", "<cmd>lua require('bacod')<cr>")
