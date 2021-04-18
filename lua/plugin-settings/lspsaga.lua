-- lspsaga
local saga = require('lspsaga')
saga.init_lsp_saga({
  code_action_icon = '💡'
})

-- code action
vim.api.nvim_command("nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>")
vim.api.nvim_command("vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

-- async lsp finder
vim.api.nvim_command("nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")

-- hover
vim.api.nvim_command("nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
vim.api.nvim_command("nnoremap <silent> <C-n> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.api.nvim_command("nnoremap <silent> <C-p> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- rename
vim.api.nvim_command("nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>")

-- show signature
vim.api.nvim_command("nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")

-- preview definition
vim.api.nvim_command("nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>")

-- jump diagnostic and show diagnostic
vim.api.nvim_command("nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")  -- show
vim.api.nvim_command("nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")  -- only show if cursor over area
vim.api.nvim_command("nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
vim.api.nvim_command("nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

-- float terminal
vim.api.nvim_command("nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>")
vim.api.nvim_command("tnoremap <silent> <A-d> <C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>")
vim.api.nvim_set_keymap('n','<Leader>g',':Lspsaga open_floaterm lazygit<CR>', {noremap = true, silent = true})
