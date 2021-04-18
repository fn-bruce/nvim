-- python indentation
vim.api.nvim_command("autocmd BufNewFile,BufRead * set tabstop=2")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set softtabstop=2")
vim.api.nvim_command("autocmd BufNewFile,BufRead * set shiftwidth=2")

-- python indentation
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set tabstop=4")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set softtabstop=4")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.py set shiftwidth=4")

-- auto save and load views
vim.api.nvim_command('augroup AutoSaveGroup')
vim.api.nvim_command('  autocmd!')
vim.api.nvim_command('  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!')
vim.api.nvim_command('  autocmd BufWinEnter ?* silent! loadview')
vim.api.nvim_command('augroup end')

-- equalize win dim when resizing vim win
vim.api.nvim_command("augroup yank")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command('autocmd TextYankPost [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]')
vim.api.nvim_command("augroup END")
