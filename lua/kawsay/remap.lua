vim.g.mapleader = " "

-- Open netrw to navigate accross files and directories
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selections up (K) and down (J)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append the line below with a space
vim.keymap.set("n", "J", "mzJ`z")

-- <C-d> and <C-u> but cursor stay at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to clipboard buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Don't press Q. Never.
vim.keymap.set("n", "Q", "<nop>")

--[[ 
  LSP
--]]
--
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- Show diagnostics in a flotaing window
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- Jumps to the declaration of the symbol under the cursor.
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- Jumps to the definition of the symbol under the cursor.
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- Displays hover information about the symbol under the cursor in a floating
  -- window.
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- Lists all the implementations for the symbol under the cursor in the
  -- quickfix window.
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
-- Make sure to use this new on_attach function when setting up LSP
require('lspconfig')['solargraph'].setup{
    on_attach = on_attach
}

