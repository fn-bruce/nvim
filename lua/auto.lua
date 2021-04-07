-- indent for all files
vim.api.nvim_command("autocmd BufNewFile,BufRead * set tabstop=2")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set softtabstop=2")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set shiftwidth=2")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set expandtab")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set autoindent")

-- python indentation
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set tabstop=4")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set softtabstop=4")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set shiftwidth=4")
