-- HTML comment
vim.api.nvim_exec([[
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
]], true)

