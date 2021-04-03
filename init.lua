require('zephyr')
require('eviline')
-- require('spaceline')

-- options
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.hidden = true
vim.o.magic = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.mouse = "nv"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.showbreak = "↳  "
vim.o.fileformats = "unix,mac,dos"
vim.o.encoding = "utf-8"
vim.o.wildignorecase = true
vim.o.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.o.directory = os.getenv("HOME").."/.cache/nvim/swag/"
vim.o.undodir = os.getenv("HOME").."/.cache/nvim/undo/"
vim.o.backupdir = os.getenv("HOME").."/.cache/nvim/backup/"
vim.o.viewdir = os.getenv("HOME").."/.cache/nvim/view/"
vim.o.spellfile = os.getenv("HOME").."/.cache/nvim/spell/en.uft-8.add"
vim.o.history = 2000
vim.o.smarttab = true

vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set synmaxcol=2500")
vim.cmd("set textwidth=80")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=-1")
vim.cmd("set wrap")
vim.cmd("set colorcolumn=80")
vim.cmd("set signcolumn=yes")
vim.cmd("set undofile")
vim.cmd("set noswapfile")
vim.cmd("set shortmess+=c")

-- variables
vim.g.completion_enable_snippet = "vim-vsnip"
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.completion_trigger_on_delete = 1
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
vim.g.completion_chain_complete_list = {
  {complete_items = {"lsp", "snippet", "path"}},
}

-- Jump forward or backward
vim.api.nvim_command("imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.api.nvim_command("smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.api.nvim_command("imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
vim.api.nvim_command("smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")

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

require('lspconfig').sumneko_lua.setup {
  on_attach = require('completion').on_attach,
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
require('lspconfig').pyls.setup{on_attach=require('completion').on_attach}
require('lspconfig').bashls.setup{on_attach=require('completion').on_attach}
require('lspconfig').dockerls.setup{on_attach=require('completion').on_attach}
require('lspconfig').jsonls.setup{on_attach=require('completion').on_attach}
require('lspconfig').vimls.setup{on_attach=require('completion').on_attach}
require('lspconfig').yamlls.setup{on_attach=require('completion').on_attach}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').html.setup{
  on_attach = require('completion').on_attach,
  capabilities = capabilities,
}
require('lspconfig').cssls.setup{
  on_attach = require('completion').on_attach,
  capabilities = capabilities,
}

require'lspconfig'.tsserver.setup{on_attach=require('completion').on_attach}

-- packer
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'glepnir/zephyr-nvim'
  use 'neovim/nvim-lspconfig'
  use 'rafamadriz/friendly-snippets'
  use 'nvim-lua/completion-nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
