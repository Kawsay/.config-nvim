require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

-- Actually setup the language servers so that they're available for our
-- LSP client. I'm mainly working with Ruby and JS, so I'm configuring
-- language servers for these 2 languages
local nvim_lsp = require('lspconfig')
nvim_lsp.solargraph.setup{}

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
require('lspconfig')['sqlls'].setup {
  on_attach = on_attach,
}






-- local lsp = require('lsp-zero').preset({
--   name = 'minimal',
--   set_lsp_keymaps = true,
--   manage_nvim_cmp = true,
--   suggest_lsp_servers = false,
-- })
--
-- lsp.set_preferences({
--   sign_icons = { }
-- })
-- -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
--
-- lsp.setup()




--local lspconfig = require("lspconfig")
--local configs = require("lspconfig.configs")
--local util = require("lspconfig.util")
--
--if not configs.ruby_lsp then
--	local enabled_features = {
--		"documentHighlights",
--		"documentSymbols",
--		"foldingRanges",
--		"selectionRanges",
--		-- "semanticHighlighting",
--		"formatting",
--		"codeActions",
--	}
--
--	configs.ruby_lsp = {
--		default_config = {
--			cmd = { "bundle", "exec", "ruby-lsp" },
--			filetypes = { "ruby" },
--			root_dir = util.root_pattern("Gemfile", ".git"),
--			init_options = {
--				enabledFeatures = enabled_features,
--			},
--			settings = {},
--		},
--		commands = {
--			FormatRuby = {
--				function()
--					vim.lsp.buf.format({
--						name = "ruby_lsp",
--						async = true,
--					})
--				end,
--				description = "Format using ruby-lsp",
--			},
--		},
--	}
--end
--
--lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
