return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        -- or                              , branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Telescope setup
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-Space>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>f", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fw", function ()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>fW", function ()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "renerocksai/telekasten.nvim",
        config = function ()
            home = vim.fn.expand("/Users/joshsack/Library/Mobile Documents/iCloud~md~obsidian/Documents/MainNotes/PARA")
            require("telekasten").setup({
                -- markdown file extension
                extension    = ".md",

                -- following a link to a non-existing note will create it
                follow_creates_nonexisting = true,
                dailies_create_nonexisting = true,
                weeklies_create_nonexisting = true,
                -- image link style
                -- wiki:     ![[image name]]
                -- markdown: ![](image_subdir/xxxxx.png)
                image_link_style = "wiki",
                 -- telescope actions behavior
                close_after_yanking = false,
                insert_after_inserting = true,

                -- tag notation: '#tag', ':tag:', 'yaml-bare'
                tag_notation = "#tag",

                -- command palette theme: dropdown (window) or ivy (bottom panel)
                command_palette_theme = "dropdown",

                -- tag list theme:
                -- get_cursor: small tag list at cursor; ivy and dropdown like above
                show_tags_theme = "dropdown",

                -- when linking to a note in subdir/, create a [[subdir/title]] link
                -- instead of a [[title only]] link
                subdirs_in_links = true,
                new_note_location = "smart",

                -- should all links be updated when a file is renamed
                rename_update_links = true,
                -- On hesitation, bring up the command panel
                vim.keymap.set('n', '<leader>pp', ':lua require("telekasten").panel()<CR>'),
                -- set \nn to create a new note with :lua require("telekasten").new_note()<CR>
                vim.keymap.set('n', '<leader>nn', ':lua require("telekasten").new_note()<CR>'),
                -- Set \rn to rename a note with :lua require("telekasten").rename_note()<CR>
                vim.keymap.set('n', '<leader>rn', ':lua require("telekasten").rename_note()<CR>'),
                -- Set \zz to toggle todo with :lua require("telekasten").toggle_todo()<CR>
                vim.keymap.set('n', '<leader>zz', ':lua require("telekasten").toggle_todo()<CR>'),
                -- Map S-<CR> to follow a link with :lua require("telekasten").follow_link()<CR>
                vim.keymap.set('n', '<S-CR>', ':lua require("telekasten").follow_link()<CR>'),
            })
        end
    },
}
