return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local cyberdream = require("lualine.themes.cyberdream")
        require("lualine").setup({
            options = {
                theme = "cyberdream",
            },
        })
    end,
}
