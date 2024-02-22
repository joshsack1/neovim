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
-- Set leader dn to dismiss noice notifications
vim.keymap.set("n", "<leader>dn", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss noice notifications"})

-- Match my obsidian settings for H, L 
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Set it so that leader tab will switch between buffers
vim.keymap.set("n", "<leader>a", ":bnext<CR>")
vim.keymap.set("n", "<leader>s", ":bprev<CR>")

-- Require transparent background
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

