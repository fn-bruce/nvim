require('zephyr')  -- theme
require('eviline')  -- galaxyline settings
require('theme')

-- variables
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n',' ','', {noremap = true})
vim.api.nvim_set_keymap('x',' ','', {noremap = true})
vim.g.completion_enable_snippet = "vim-vsnip"
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.completion_trigger_on_delete = 1
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
vim.g.completion_chain_complete_list = {
  {complete_items = {"lsp", "snippet", "path"}},
}

require('mappings')
require('plugins.settings')
require('options')  -- vim options
require('auto')

-- packer
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'glepnir/zephyr-nvim'
  use 'neovim/nvim-lspconfig'
  use 'rafamadriz/friendly-snippets'
  use 'nvim-lua/completion-nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'glepnir/lspsaga.nvim'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'tpope/vim-dadbod'
  use 'norcalli/nvim-colorizer.lua'
  use 'Raimondi/delimitMate'
  use 'rhysd/accelerated-jk'
  use 'glepnir/dashboard-nvim'
  use 'glepnir/indent-guides.nvim'
  use 'brooth/far.vim'
  use 'liuchengxu/vista.vim'
  use 'tpope/vim-surround'
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-commentary'
  use 'mxw/vim-jsx'
  use 'alvan/vim-closetag'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
