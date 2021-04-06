-- replace curr selected txt with default register w/o yanking it
vim.api.nvim_set_keymap('v','<leader>p','_dP', {noremap = true})

-- copy text from clipboard
vim.api.nvim_set_keymap('n','<leader>y','"+y', {noremap = true})
vim.api.nvim_set_keymap('v','<leader>y','"+y', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>Y','gg"+yG', {noremap = true})


-- scroll horizontally
vim.api.nvim_set_keymap('','<leader>l','20zl', {})
vim.api.nvim_set_keymap('','<leader>h','20zh', {})

-- window navigation
vim.api.nvim_set_keymap('n','<C-h>','<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n','<C-l>','<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n','<C-j>','<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n','<C-k>','<C-w>k', {noremap = true})

-- resize windows
vim.api.nvim_set_keymap('n','<A-h>',':vertical resize +5<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<A-l>',':vertical resize -5<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<A-j>',':resize -5<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<A-k>',':resize +5<CR>', {noremap = true})

-- save
vim.api.nvim_set_keymap('n','<C-s>',':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i','<C-s>','<Esc>:w<CR>', {noremap = true})

-- quit
vim.api.nvim_set_keymap('n','<C-q>',':wq<CR>', {noremap = true})
vim.api.nvim_set_keymap('i','<C-q>','<Esc>:wq<CR>', {noremap = true})
