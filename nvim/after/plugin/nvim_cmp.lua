vim.cmd [[
 augroup nvim_cmp
 au!
 autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
 augroup END
 ]]
