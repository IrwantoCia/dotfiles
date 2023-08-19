function ColorMyPencils(color)
  color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--ColorMyPencils("moonfly")
--ColorMyPencils("rose-pine")
--ColorMyPencils("pop-punk")
--ColorMyPencils("github_dark")
--ColorMyPencils("github_dark_dimmed")

--ColorMyPencils("kanagawa-wave")
ColorMyPencils("kanagawa-dragon")
--ColorMyPencils("kanagawa-lotus")

--ColorMyPencils("github_dark_high_contrast")
--ColorMyPencils("vividchalk")
--ColorMyPencils("eldar")
