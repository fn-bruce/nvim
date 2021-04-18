-- packer
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

	-- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-lua/completion-nvim'

	-- THEME
  use 'glepnir/zephyr-nvim'

	-- UI
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'glepnir/dashboard-nvim'      -- main menu when starting nvim with no files
  use 'norcalli/nvim-colorizer.lua' -- create color background for hex colors
  use 'glepnir/indent-guides.nvim'  -- highlight indents
  use 'scr1pt0r/crease.vim'         -- modify fold message easier
  use {
		'nvim-treesitter/nvim-treesitter',  -- syntax highlighting
		run = ':TSUpdate',
	}
  use {
    'glepnir/galaxyline.nvim',  -- bottom bar
		branch = 'main',
		config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

	-- GIT
  use {
    'lewis6991/gitsigns.nvim',  -- git statuses
    requires = {'nvim-lua/plenary.nvim'}
  }
  use 'kdheepak/lazygit.nvim'  -- fancy git ui

	-- TOOLS
  use {
    'kyazdani42/nvim-tree.lua',  -- file tree explorer
    commit = 'ed23e1df1c654657a38003a2cb010003d6fc4dc9',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-telescope/telescope.nvim',  -- extendable fuzzy finder
    requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
  }
  use 'brooth/far.vim'        -- easier way to find and replace text through multiple files
  use 'tpope/vim-surround'    -- manipulate surrounding characters
  use 'tpope/vim-commentary'  -- comment things
  use 'alvan/vim-closetag'    -- auto close html tags
  use 'tpope/vim-repeat'      -- repeat plugin mappings with .
	use 'jiangmiao/auto-pairs'  -- automatically close pairs

	-- SNIPPETS
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'
end)
