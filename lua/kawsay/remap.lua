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
