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
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/dashboard-nvim'
  use 'glepnir/indent-guides.nvim'
  use 'brooth/far.vim'
  use 'tpope/vim-surround'
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-commentary'
  use 'alvan/vim-closetag'
  use 'scr1pt0r/crease.vim'
  use 'tpope/vim-repeat'
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
    commit = 'ed23e1df1c654657a38003a2cb010003d6fc4dc9',
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
