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
