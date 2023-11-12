vim.keymap.set("n", "<leader>gs", function ()
    vim.cmd("vertical G")
    -- resize the split buffer
    vim.cmd("vertical resize 50")
end
)
