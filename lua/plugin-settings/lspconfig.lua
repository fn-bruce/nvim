vim.g.completion_enable_snippet = "vim-vsnip"
vim.g.completion_trigger_on_delete = 1
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
vim.g.completion_chain_complete_list = {
  {complete_items = {"lsp", "snippet", "path"}},
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

