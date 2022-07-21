-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local mapb = vim.api.nvim_buf_set_keymap
local map = vim.api.nvim_set_keymap

local bufopts = { noremap=true, silent=true }
map('n', '<space>e', '<cmd>vim.diagnostic.open_float<CR>', bufopts)
map('n', '[d', '<cmd>vim.diagnostic.goto_prev<CR>', bufopts)
map('n', ']d', '<cmd>vim.diagnostic.goto_next<CR>', bufopts)
map('n', '<space>q', '<cmd>vim.diagnostic.setloclist<CR>', bufopts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client,bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  mapb(bufnr,'n', 'gD', '<cmd>lua vim.lsp.buf.declaration<CR>', bufopts)
  mapb(bufnr,'n', 'gd', '<cmd>lua vim.lsp.buf.definition<CR>', bufopts)
  mapb(bufnr,'n', 'K', '<cmd>lua vim.lsp.buf.hover<CR>', bufopts)
  mapb(bufnr,'n', 'gi', '<cmd>lua vim.lsp.buf.implementation<CR>', bufopts)
  mapb(bufnr,'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help<CR>', bufopts)
  mapb(bufnr,'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder<CR>', bufopts)
  mapb(bufnr,'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>', bufopts)
  mapb(bufnr,'n', '<space>wl','lua function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end', bufopts)
  mapb(bufnr,'n', 'gT', '<cmd>lua vim.lsp.buf.type_definition<CR>', bufopts)
  mapb(bufnr,'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename<CR>', bufopts)
  mapb(bufnr,'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action<CR>', bufopts)
  mapb(bufnr,'n', 'gr', '<cmd>lua vim.lsp.buf.references<CR>', bufopts)
  mapb(bufnr,'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting<CR>', bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--

local servers = { 'pylsp', 'clangd','sumneko_lua','kotlin_language_server','rust_analyzer'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

