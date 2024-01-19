-- Easily move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Make it so that in visual mode it is easy to move to the beginning and end of each line 
vim.keymap.set("i", "<C-h>", "<C-o>I")
vim.keymap.set("i", "<C-l>", "<C-o>A")
-- Make it so that in insert mode, it is easy to select to the begging, end, or whole line in visual mode
vim.keymap.set("i", "<C-a>", "<Esc>^V")
vim.keymap.set("i", "<C-S-h>", "<Esc>v_")
vim.keymap.set("i", "<C-S-l>", "<Esc>v$")
