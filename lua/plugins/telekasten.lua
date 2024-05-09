return {
    {    "nvim-telekasten/telekasten.nvim",
        config = function ()
            require("telekasten").setup({
                home = vim.fn.expand("/Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettlekasten"), -- Home Directory
                extension = ".md", -- File extension
                --NOTE: following a link to a nonexistent file will create it
                follow_creates_nonexisting = true,
                image_link_style = "wiki", -- "wiki" or "markdown"
                tag_notation= "#tag",
                new_note_location = "smart",
                subdirs_in_links = true,
            })
            --NOTE: Shortcuts
            vim.keymap.set("n", "<leader>z", ":lua require('telekasten').panel()<CR>")
            vim.keymap.set("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>")
            vim.keymap.set("n", "<leader>zs", ":lua require('telekasten').search_notes()<CR>")
            vim.keymap.set("n", "<leader>zt", ":lua require('telekasten').show_tags()<CR>")
            vim.keymap.set("n", "<leader>zd", ":lua require('telekasten').toggle_todo()<CR>")
        end
    },
    {
        "nvim-telekasten/calendar-vim",
        config = function ()
            vim.keymap.set("n", "<leader>td", ":Calendar<CR>")
        end
    },
}
