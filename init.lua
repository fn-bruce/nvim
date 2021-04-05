require('zephyr')
require('eviline')
-- require('spaceline')

-- options
local cache_dir = os.getenv("HOME").."/.cache/nvim/"
local completeopt = table.concat({
  "menuone",
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
vim.o.termguicolors   = true  -- enable 24-bit rgb color
vim.o.splitright      = true  -- split window on right
vim.o.splitbelow      = true  -- split window on bottom
vim.o.hidden          = true  -- hide buffer when abandoned
vim.o.magic           = true  -- a different way to search
vim.o.backup          = false  -- don't create a file backup
vim.o.writebackup     = false  -- don't make backup before overwriting a file
vim.o.mouse           = "nv"  -- enables mouse support
vim.o.completeopt     = completeopt  -- insert mode completion options
vim.o.showbreak       = "↳  "  -- string to put at start of wrapped lines
vim.o.fileformats     = fileformats  -- gives end-of-line formats
vim.o.encoding        = "utf-8"  -- string-encoding used for RPC communication
vim.o.wildignorecase  = true  -- ignore case when completing file names and directories
vim.o.wildignore      = wildignore  -- files ignored when completing
vim.o.directory       = cache_dir.."swag/"
vim.o.undodir         = cache_dir.."undo/"
vim.o.backupdir       = cache_dir.."backup/"
vim.o.viewdir         = cache_dir.."view/"
vim.o.spellfile       = cache_dir.."spell/en.uft-8.add"
vim.o.history         = 2000  -- command-line history length
vim.o.smarttab        = true
vim.o.shortmess       = vim.o.shortmess.."c"  -- don't give ins_cmpletion-menu messages
vim.o.viewoptions     = "folds,cursor,curdir"  -- what to save for views
vim.o.sessionoptions  = "curdir,help,tabpages,winsize" -- what to save for sessions
vim.o.shada           = "!,'300,<50,@100,s10,h"  -- some settings to control what to save
vim.o.backupskip      = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
vim.o.shiftround      = true
vim.o.timeout         = true
vim.o.ttimeout        = true
vim.o.timeoutlen      = 500
vim.o.ttimeoutlen     = 10
vim.o.updatetime      = 100
vim.o.redrawtime      = 1500
vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.o.infercase       = true
vim.o.incsearch       = true  -- highlights search command in real time
vim.o.wrapscan        = true
vim.o.complete        = ".,w,b,k"
vim.o.inccommand      = "nosplit"
vim.o.grepprg         = 'rg --hidden --vimgrep --smart-case --'
vim.o.breakat         = [[\ \	;:,!?]]
vim.o.startofline     = false
vim.o.whichwrap       = "h,l,<,>,[,],~"  -- wrap to next line if reach end. some configs
vim.o.switchbuf       = "useopen"
vim.o.backspace       = "indent,eol,start"
vim.o.diffopt         = "filler,iwhite,internal,algorithm:patience";
vim.o.jumpoptions     = "stack"
vim.o.showmode        = false  -- hides the word for the mode (bottom left)
vim.o.shortmess       = "aoOTIcF"  -- don't give ins_cmpletion-menu messages
vim.o.scrolloff       = 2
vim.o.sidescrolloff   = 5
vim.o.foldlevelstart  = 99
vim.o.ruler           = false
vim.o.listchars       = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.o.showtabline     = 2
vim.o.winwidth        = 30
vim.o.winminwidth     = 15
vim.o.pumheight       = 15
vim.o.previewheight   = 12
vim.o.helpheight      = 12
vim.o.previewheight   = 12
vim.o.showcmd         = false  -- real time cmd typing (bottom right)
vim.o.cmdheight       = 2
vim.o.cmdwinheight    = 5
vim.o.equalalways     = false
vim.o.laststatus      = 2
vim.o.display         = "lastline"
vim.o.pumblend        = 10  -- makes pop-up menu transparent
vim.o.winblend        = 10  -- makes pop-up windows transparent

-- window-scoped options
vim.wo.relativenumber = true  -- show line number relative to line w/ cursor
vim.wo.number         = true  -- show side line numbers
vim.wo.colorcolumn    = "80"  -- color column
vim.wo.signcolumn     = "yes"  -- adds that extra side column for symbols
vim.wo.wrap           = false  -- wrap text
vim.wo.list           = true
vim.wo.breakindentopt = "shift:2,min:20"
vim.wo.linebreak      = true

-- buffer-scoped options
vim.bo.undofile    = true
vim.bo.swapfile    = false
vim.bo.synmaxcol   = 2500
vim.bo.textwidth   = 80
vim.bo.expandtab   = true
vim.bo.autoindent  = true
vim.bo.tabstop     = 2
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = -1

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

-- replace curr selected txt with default register w/o yanking it
vim.api.nvim_set_keymap('v','<leader>p','_dP', {noremap = true})

-- copy text from clipboard
vim.api.nvim_set_keymap('n','<leader>y','"+y', {noremap = true})
vim.api.nvim_set_keymap('v','<leader>y','"+y', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>Y','gg"+yG', {noremap = true})


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

-- auto save and load views
vim.api.nvim_command('autocmd BufWinLeave *.* mkview')
vim.api.nvim_command('autocmd BufWinEnter *.* silent loadview')

-- equalize win dim when resizing vim win
vim.api.nvim_command("augroup yank")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command('autocmd TextYankPost [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]')
vim.api.nvim_command("augroup END")

-- treesitter
vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require('nvim-treesitter.configs').setup {
  -- ensure_installed = "maintained",   -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
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

-- dashboard
vim.g.dashboard_footer_icon = '🐬 '
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  last_session = {
    description = {'  Recently laset session                  SPC s l'},
    command =  'SessionLoad'},
  find_history = {
    description = {'  Recently opened files                   SPC f h'},
    command =  'DashboardFindHistory'},
  find_file  = {
    description = {'  Find  File                              SPC f f'},
    command = 'Telescope find_files find_command=rg,--hidden,--files'},
  new_file = {
    description = {'  File Browser                            SPC f b'},
    command =  'Telescope file_browser'},
  find_word = {
    description = {'  Find  word                              SPC f w'},
    command = 'DashboardFindWord'},
  find_dotfiles = {
    description = {'  Open Personal dotfiles                  SPC f d'},
    command = 'Telescope dotfiles path=' .. '~/.dotfiles'},
  go_source = {
    description = {'  Find Go Source Code                     SPC f s'},
    command = 'Telescope gosource'},
}

-- bufferline
require('bufferline').setup {
  options = {
    modified_icon = '✥',
    buffer_close_icon = '',
    mappings = true,
    always_show_bufferline = false,
  }
}

-- far
vim.g['far#source'] = 'rg'
-- gitsigns
require('gitsigns').setup {
  signs = {
    add = {hl = 'GitGutterAdd', text = '▋'},
    change = {hl = 'GitGutterChange',text= '▋'},
    delete = {hl= 'GitGutterDelete', text = '▋'},
    topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
    changedelete = {hl = 'GitGutterChange', text = '▎'},
  },
  keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
}

-- vista
vim.g['vista#renderer#enable_icon'] = 1
vim.g.vista_disable_statusline = 1
vim.g.vista_default_executive = 'ctags'
vim.g.vista_echo_cursor_strategy = 'floating_win'
vim.g.vista_vimwiki_executive = 'markdown'
vim.g.vista_executive_for = {
  vimwiki =  'markdown',
  pandoc = 'markdown',
  markdown = 'toc',
  typescript = 'nvim_lsp',
  typescriptreact =  'nvim_lsp',
}

-- vim-operator-surround
vim.api.nvim_set_keymap('','sa','<Plug>(operator-surround-append)', {silent = true})
vim.api.nvim_set_keymap('','sd','<Plug>(operator-surround-delete)', {silent = true})
vim.api.nvim_set_keymap('','sr','<Plug>(operator-surround-replace)', {silent = true})

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
  use {
    'rhysd/vim-operator-surround',
    requires = {'kana/vim-operator-user'}
  }
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
