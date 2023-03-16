-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --
  -- Packer can manage itself
  --
  use 'wbthomason/packer.nvim'

  --
  -- Fuzzy finder
  --
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --
  -- Color schema
  --
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  require("rose-pine").setup({
        dark_variant = 'moon',
        groups = {
          method = 'foam'
        }
      })
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use('Mofiqul/vscode.nvim')

  --
  -- Parser & syntax highlighting helper
  --
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('RRethy/nvim-treesitter-endwise')

  --
  -- Easy file navigation
  --
  use('theprimeagen/harpoon')

  --
  -- Git helper
  --
  use('tpope/vim-fugitive')

  --
  -- LSP
  --
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')


  --
  -- Rails support
  --
  use('tpope/vim-rails')

  --
  -- Identify trailing spaces
  --
  -- TODO: Set Github
  -- use('bronson/vim-trailing-whitespaces')

  --
  -- Allow # and * to work with visual selections
  --
  use('nelstrom/vim-visual-star-search')
end)
