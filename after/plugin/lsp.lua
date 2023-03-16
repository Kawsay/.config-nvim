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
