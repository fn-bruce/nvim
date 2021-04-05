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
local lspconfig = require('lspconfig')
local completion = require('completion').on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
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

lspconfig.sumneko_lua.setup {
  on_attach = completion,
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
lspconfig.pyls.setup{on_attach=completion}
lspconfig.bashls.setup{on_attach=completion}
lspconfig.dockerls.setup{on_attach=completion}
lspconfig.jsonls.setup{on_attach=completion}
lspconfig.vimls.setup{on_attach=completion}
lspconfig.yamlls.setup{on_attach=completion}
lspconfig.html.setup{on_attach = completion, capabilities = capabilities}
lspconfig.cssls.setup{on_attach = completion, capabilities = capabilities}
lspconfig.tsserver.setup{on_attach=completion}

-- lspsaga
local saga = require('lspsaga')
saga.init_lsp_saga({
  code_action_icon = '💡'
})

-- Async Lsp Finder
vim.api.nvim_command("nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")

-- Hover
vim.api.nvim_command("nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
vim.api.nvim_command("nnoremap <silent> <C-n> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.api.nvim_command("nnoremap <silent> <C-p> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- Rename
vim.api.nvim_command("nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>")

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

-- databod ui
vim.g.db_ui_win_position = 'left'
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_winwidth = 35
vim.g.db_ui_save_location = os.getenv("HOME") .. '/.cache/vim/db_ui_queries'
vim.api.nvim_set_keymap('n','<leader>od',':DBUIToggle<CR>', {noremap = true, silent = true})

-- cursorword
vim.api.nvim_command('augroup user_plugin_cursorword')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
vim.api.nvim_command('augroup END')

-- accelerated-jk
vim.api.nvim_command('nmap j <Plug>(accelerated_jk_gj)')
vim.api.nvim_command('nmap k <Plug>(accelerated_jk_gk)')

-- vim-eft
vim.api.nvim_set_keymap('n',';','<Plug>(eft-repeat)', {})
vim.api.nvim_set_keymap('x',';','<Plug>(eft-repeat)', {})

vim.api.nvim_set_keymap('n','f','<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('x','f','<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('o','f','<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('n','F','<Plug>(eft-F)', {})
vim.api.nvim_set_keymap('x','F','<Plug>(eft-F)', {})
vim.api.nvim_set_keymap('o','F','<Plug>(eft-F)', {})

vim.api.nvim_set_keymap('n','t','<Plug>(eft-t)', {})
vim.api.nvim_set_keymap('x','t','<Plug>(eft-t)', {})
vim.api.nvim_set_keymap('o','t','<Plug>(eft-t)', {})
vim.api.nvim_set_keymap('n','T','<Plug>(eft-T)', {})
vim.api.nvim_set_keymap('x','T','<Plug>(eft-T)', {})
vim.api.nvim_set_keymap('o','T','<Plug>(eft-T)', {})

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
  -- use 'itchyny/vim-cursorword'
  use 'Raimondi/delimitMate'
  use 'rhysd/accelerated-jk'
  use 'hrsh7th/vim-eft'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require('statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
