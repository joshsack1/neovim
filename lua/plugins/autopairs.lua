return {
    {
        "windwp/nvim-autopairs",
        config = function ()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
    },
}
