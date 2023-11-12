vim.g.mapleader = " "
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- remap split screen shift
vim.keymap.set("n", "<leader>vs", "<C-w>v")
vim.keymap.set("n", "<leader>hs", "<C-w>s")
vim.keymap.set("n", "<leader>=", "<C-w>=")
vim.keymap.set("n", "<leader>+", "<C-w>+")
vim.keymap.set("n", "<leader>-", "<C-w>-")

-- remap Ctrl-hjkl to move between windows noremapping
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- remap ctrl-w to quit with wq!
vim.keymap.set("n", "<C-w>", ":wq!<CR>")

vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>rb", function()
    vim.cmd('!cargo build')
end)

vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
-- map git push to leader gp
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so %")
end)

-- using jq for json formatting buffer all lines
vim.keymap.set("n", "<leader>jq", function()
    vim.cmd(":%!jq .")
end)

-- toggle database
vim.keymap.set("n", "<leader>tdb", function()
    vim.cmd("DBUIToggle")
end)

-- toggle current buffer widht/height to half of screen
PREVIOUS_HEIGHT = vim.api.nvim_win_get_width(0)
PREVIOUS_WIDTH = vim.api.nvim_win_get_height(0)

vim.keymap.set("n", "<leader>ts", function() -- ts = toggle size
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    local cur_width = vim.api.nvim_win_get_width(0)
    local cur_height = vim.api.nvim_win_get_height(0)

    if cur_width == width then
        vim.api.nvim_win_set_width(0, PREVIOUS_WIDTH)
    else
        vim.api.nvim_win_set_width(0, width)
    end
    if cur_height == height then
        vim.api.nvim_win_set_height(0, PREVIOUS_HEIGHT)
    else
        vim.api.nvim_win_set_height(0, height)
    end
end)
