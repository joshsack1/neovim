--return {
--    "epwalsh/obsidian.nvim",
--    version = "*",  -- recommended, use latest release instead of latest commit
--    lazy = true,
--    ft = "markdown",
--    config = function ()
--        require("obsidian").setup({
--            workspaces = {
--                {
--                    name = "Notes",
--                    path = "/Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/MainNotes/PARA",
--                },
--            },
--            completion = {
--                nvim_cmp = true,
--                min_chars = 2, -- This sets the minimum number of charachters to set up completion
--                -- Where to put new notes created from completion. Valid options are
--                --  * "current_dir" - put new notes in same directory as the current buffer.
--                --  * "notes_subdir" - put new notes in the default notes subdirectory.
--                notes_subdir = "notes_subdir",

--                -- Control how wiki links are completed with these (mutually exclusive) options:
--                --
--                -- 1. Whether to add the note ID during completion.
--                -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
--                -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
--                prepend_note_id = false,
--                -- 2. Whether to add the note path during completion.
--                -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
--                -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
--                prepend_note_path = false,
--                -- 3. Whether to only use paths during completion.
--                -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
--                -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
--                use_path_only = false,
--            },
--            templates = {
--                subdir = "Templates",
--                date_format = "%Y-%m-%d-%a",
--                time_format = "%H:%M",
--            },
--        })
--        -- vim.keymap.set("n", "<S-CR>", ":ObsidianFollowLink<CR>")
--        -- vim.keymap.set({"n", "i", "v"}, "<C-b>", ":ObsidianBacklinks<CR>")
--        -- vim.keymap.set("v", "<leader>k", ":ObsidianLinkNew<CR>")
--        -- vim.keymap.set("v", "<leader>kk", ":ObsidianLink<CR>")
--    end
--}

-- Copying some of what ZazenCodes has done
return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        require("obsidian").setup({
            workspaces = {
                {name = "Notes",
                path = "/Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettlekasten",}
            },
            notes_subdir = "Inbox",
            new_notes_location = "notes_subdir",

            disable_frontmatter = true,
            templates = {
                subdir = "Templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M:%S",
            },

            -- name new notes starting the ISO datetime and ending with note name
            -- put them in the inbox subdir
            -- note_id_func = function(title)
            --   local suffix = ""
            --   -- get current ISO datetime with -5 hour offset from UTC for EST
            --   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
            --   if title ~= nil then
            --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            --   else
            --     for _ = 1, 4 do
            --       suffix = suffix .. string.char(math.random(65, 90))
            --     end
            --   end
            --   return current_datetime .. "_" .. suffix
            -- end,
            -- Key Mappings
            mappings = {
                -- Override "gf" to open Obsidian note
                ["gf"] = {
                    action = function ()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = {noremap = false, expr = true, buffer = true},
                }
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2, -- This sets the minimum number of charachters to set up completion
            },
            ui = {
                enable = false,
            },
        })
        -- Set up keymappings
        vim.keymap.set("n", "<leader>oo", ":cd /Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettlekasten<CR>")
        -- convert note to template and remove leading white space
        vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
        -- strip date from note title and replace dashes with spaces
        -- must have cursor on title
        vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
        vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /Users/joshsack/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Zettlekasten/Review<cr>:bd<cr>")
    end
}
