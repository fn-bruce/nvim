require('zephyr')
require('eviline')
-- require('spaceline')

vim.api.nvim_command('set number')
vim.api.nvim_command('set relativenumber')
vim.api.nvim_command('set splitright')
vim.api.nvim_command('set splitbelow')
vim.api.nvim_command('set mouse=a')
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')

-- treesitter
require('nvim-treesitter.configs').setup {
  -- ensure_installed = "maintained",   -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
}

-- lspconfig
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.vn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.vn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  on_attach=require'completion'.on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- packer
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'glepnir/zephyr-nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
