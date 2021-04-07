-- Jump forward or backward
vim.api.nvim_command("imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.api.nvim_command("smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.api.nvim_command("imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
vim.api.nvim_command("smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")

-- auto save and load views
vim.api.nvim_command('augroup AutoSaveGroup')
vim.api.nvim_command('  autocmd!')
vim.api.nvim_command('  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!')
vim.api.nvim_command('  autocmd BufWinEnter ?* silent! loadview')
vim.api.nvim_command('augroup end')

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

-- code action
vim.api.nvim_command("nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>")
vim.api.nvim_command("vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

-- async lsp finder
vim.api.nvim_command("nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")

-- hover
vim.api.nvim_command("nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
vim.api.nvim_command("nnoremap <silent> <C-n> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.api.nvim_command("nnoremap <silent> <C-p> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- rename
vim.api.nvim_command("nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>")

-- show signature
vim.api.nvim_command("nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")

-- preview definition
vim.api.nvim_command("nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>")

-- jump diagnostic and show diagnostic
vim.api.nvim_command("nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")  -- show
vim.api.nvim_command("nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")  -- only show if cursor over area
vim.api.nvim_command("nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
vim.api.nvim_command("nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

-- float terminal
vim.api.nvim_command("nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>")
vim.api.nvim_command("tnoremap <silent> <A-d> <C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>")
vim.api.nvim_set_keymap('n','<Leader>g',':Lspsaga open_floaterm lazygit<CR>', {noremap = true, silent = true})

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
    description = {'  Last Session                            SPC s l'},
    command =  'SessionLoad'},
  find_history = {
    description = {'  Recently Opened Files                   SPC f h'},
    command =  'DashboardFindHistory'},
  find_file  = {
    description = {'  Find File                               SPC f f'},
    command = 'Telescope find_files find_command=rg,--hidden,--files,--glob,!.git'},
  new_file = {
    description = {'  File Browser                            SPC f b'},
    command =  'Telescope file_browser'},
  find_word = {
    description = {'  Find Word                               SPC f w'},
    command = 'DashboardFindWord'},
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

-- telescope
vim.api.nvim_set_keymap('n','<Leader>bb',':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fa',':DashboardFindWord<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fb',':Telescope file_browser<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n','<Leader>ff',':DashboardFindFile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>ff',':Telescope find_files find_command=rg,--hidden,--files,--glob,!.git<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fg',':Telescope git_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fw',':Telescope grep_string<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fh',':DashboardFindHistory<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>fc',':Telescope git_commits<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>ft',':Telescope help_tags<CR>', {noremap = true, silent = true})
