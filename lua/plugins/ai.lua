return {
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup()
            vim.keymap.set("n", "<leader>sm", ":ChatGPTRun summarize<CR>")
            vim.keymap.set("n", "<leader>ai", ":ChatGPT<CR>")
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    accept = false,
                    keymap = {
                        accept = "<leader><Space>",
                        accept_word = "<leader>w",
                        dismiss = "<leader>d"
                    }
                },
            })
            -- hide copilot suggestions when cmp menu is open
            -- to prevent odd behavior/garbled up suggestions
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if cmp_status_ok then
                cmp.event:on("menu_opened", function()
                    vim.b.copilot_suggestion_hidden = true
                end)

                cmp.event:on("menu_closed", function()
                    vim.b.copilot_suggestion_hidden = false
                end)
            end
        end
    },
    {
        {
            "jellydn/CopilotChat.nvim",
            opts = {
                mode = "split", -- newbuffer or split  , default: newbuffer
                prompts = {
                    Explain = "Explain how it works.",
                    Review = "Review the following code and provide concise suggestions.",
                    Tests = "Briefly explain how the selected code works, then generate unit tests.",
                    Refactor = "Refactor the code to improve clarity and readability.",
                },
            },
            build = function()
                vim.defer_fn(function()
                    vim.cmd("UpdateRemotePlugins")
                    vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
                end, 3000)
            end,
            event = "VeryLazy",
            keys = {
                { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
                { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
                { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
                { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
            },
        },
    }
}
