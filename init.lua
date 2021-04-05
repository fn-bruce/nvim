require('zephyr')
require('eviline')
-- require('spaceline')

-- options
local cache_dir = os.getenv("HOME").."/.cache/nvim/"
local completeopt = table.concat({
  "menuone",
  "noinsert",
  "noselect",
}, ",")
local wildignore = table.concat({
  "**/bower_modules/**",
  "**/node_modules/**",
  "**/tmp/**",
  "*.DS_Store",
  "*.gif",
  "*.jpeg",
  "*.jpg",
  "*.o",
  "*.out",
  "*.png",
  "*.pyc",
  "*.zip",
  ".git",
  ".hg",
  ".svn",
}, ",")
local fileformats = table.concat({
  "unix",
  "mac",
  "dos",
}, ",")

-- regular options
vim.o.termguicolors  = true  -- enable 24-bit rgb color
vim.o.splitright     = true  -- split window on right
vim.o.splitbelow     = true  -- split window on bottom
vim.o.hidden         = true  -- hide buffer when abandoned
vim.o.magic          = true  -- a different way to search
vim.o.backup         = false  -- don't create a file backup
vim.o.writebackup    = false  -- don't make backup before overwriting a file
vim.o.mouse          = "nv"  -- enables mouse support
vim.o.completeopt    = completeopt  -- insert mode completion options
vim.o.showbreak      = "↳  "  -- string to put at start of wrapped lines
vim.o.fileformats    = fileformats  -- gives end-of-line formats
vim.o.encoding       = "utf-8"  -- string-encoding used for RPC communication
vim.o.wildignorecase = true  -- ignore case when completing file names and directories
vim.o.wildignore     = wildignore  -- files ignored when completing
vim.o.directory      = cache_dir.."swag/"
vim.o.undodir        = cache_dir.."undo/"
vim.o.backupdir      = cache_dir.."backup/"
vim.o.viewdir        = cache_dir.."view/"
vim.o.spellfile      = cache_dir.."spell/en.uft-8.add"
vim.o.history        = 2000  -- command-line history length
vim.o.smarttab       = true
vim.o.shortmess      = vim.o.shortmess.."c"  -- don't give ins_cmpletion-menu messages

-- window-scoped options
vim.wo.relativenumber = true  -- show line number relative to line w/ cursor
vim.wo.number         = true  -- show side line numbers
vim.wo.colorcolumn    = "80"  -- color column
vim.wo.signcolumn     = "yes"  -- adds that extra side column for symbols
vim.wo.wrap           = true  -- wrap text

-- buffer-scoped options
vim.bo.synmaxcol   = 2500
vim.bo.textwidth   = 80
vim.bo.expandtab   = true
vim.bo.autoindent  = true
vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = -1
vim.bo.undofile    = true
vim.bo.swapfile    = false

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

-- accelerated-jk
vim.api.nvim_command('nmap j <Plug>(accelerated_jk_gj)')
vim.api.nvim_command('nmap k <Plug>(accelerated_jk_gk)')

-- vim-eft
-- vim.api.nvim_set_keymap('n',';','<Plug>(eft-repeat)', {})
-- vim.api.nvim_set_keymap('x',';','<Plug>(eft-repeat)', {})
--
-- vim.api.nvim_set_keymap('n','f','<Plug>(eft-f)', {})
-- vim.api.nvim_set_keymap('x','f','<Plug>(eft-f)', {})
-- vim.api.nvim_set_keymap('o','f','<Plug>(eft-f)', {})
-- vim.api.nvim_set_keymap('n','F','<Plug>(eft-F)', {})
-- vim.api.nvim_set_keymap('x','F','<Plug>(eft-F)', {})
-- vim.api.nvim_set_keymap('o','F','<Plug>(eft-F)', {})
--
-- vim.api.nvim_set_keymap('n','t','<Plug>(eft-t)', {})
-- vim.api.nvim_set_keymap('x','t','<Plug>(eft-t)', {})
-- vim.api.nvim_set_keymap('o','t','<Plug>(eft-t)', {})
-- vim.api.nvim_set_keymap('n','T','<Plug>(eft-T)', {})
-- vim.api.nvim_set_keymap('x','T','<Plug>(eft-T)', {})
-- vim.api.nvim_set_keymap('o','T','<Plug>(eft-T)', {})

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
