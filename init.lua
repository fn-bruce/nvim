require('zephyr')
require('eviline')
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",   -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
}
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'glepnir/zephyr-nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
