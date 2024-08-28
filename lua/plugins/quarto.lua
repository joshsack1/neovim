return {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    config = function ()
        require("quarto").setup({
            -- your configuration comes here
        })
    end
}
