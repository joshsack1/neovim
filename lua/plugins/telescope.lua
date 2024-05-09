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
}
