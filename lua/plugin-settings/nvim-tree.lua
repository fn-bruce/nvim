-- nvim-tree
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_bindings = {
  ["l"] = ":lua require('nvim-tree').on_keypress('edit')<CR>",
  ["s"] = ":lua require('nvim-tree').on_keypress('vsplit')<CR>",
  ["i"] = ":lua require('nvim-tree').on_keypress('split')<CR>",
}
vim.g.nvim_tree_icons = {
  default =  '',
  symlink =  '',
  git = {
   unstaged = "✚",
   staged =  "✚",
   unmerged =  "≠",
   renamed =  "≫",
   untracked = "★",
  },
}
vim.api.nvim_set_keymap('n','<leader>e',':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>F',':NvimTreeFindFile<CR>', {noremap = true, silent = true})
