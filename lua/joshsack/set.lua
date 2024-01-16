-- Set up some basic options
vim.opt.nu = true
vim.opt.relativenumber = true
-- Set the tabstop to four to limit function width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- set up spellcheck
-- also set the buffer to the clipboard
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.cmd[[
set clipboard+=unnamedplus]]

-- Remove the swapfile
vim.opt.swapfile = false

-- Set leader x to unhighlight search results
vim.keymap.set("n", "<leader>x", ":nohlsearch<CR>")

-- Match my obsidian settings for H, L 
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
