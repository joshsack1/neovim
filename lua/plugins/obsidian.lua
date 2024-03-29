return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    config = function ()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "Notes",
                    path = "/Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/MainNotes/PARA",
                },
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2, -- This sets the minimum number of charachters to set up completion
                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                notes_subdir = "notes_subdir",

                -- Control how wiki links are completed with these (mutually exclusive) options:
                --
                -- 1. Whether to add the note ID during completion.
                -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
                -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
                prepend_note_id = false,
                -- 2. Whether to add the note path during completion.
                -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
                -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
                prepend_note_path = false,
                -- 3. Whether to only use paths during completion.
                -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
                -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
                use_path_only = false,
            },
            templates = {
                subdir = "Templates",
                date_format = "%Y-%m-%d-%a",
                time_format = "%H:%M",
            },
        })
        -- vim.keymap.set("n", "<S-CR>", ":ObsidianFollowLink<CR>")
        -- vim.keymap.set({"n", "i", "v"}, "<C-b>", ":ObsidianBacklinks<CR>")
        -- vim.keymap.set("v", "<leader>k", ":ObsidianLinkNew<CR>")
        -- vim.keymap.set("v", "<leader>kk", ":ObsidianLink<CR>")
    end
}
