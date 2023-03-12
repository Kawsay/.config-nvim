vim.api.nvim_create_autocmd("ColorScheme", {
	pattern="rose-pine",
	callback = function()
		vim.api.nvim_set_hl(0, "@number", { fg="#eb6f92" })
		vim.api.nvim_set_hl(0, "@type",   { fg="#7fe8f0" })
		vim.api.nvim_set_hl(0, "@symbol", { fg="#ebabe4" })
		vim.api.nvim_set_hl(0, "@function.call", { fg="#deeff4" })
	end,
  }
)
