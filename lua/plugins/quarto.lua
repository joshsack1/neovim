return {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    config = function ()
        require("quarto").setup({
            lspFeatures = {
                enabled = true,
                langauges = {'r', 'python', 'julia', 'lua'},
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWrite" },
                },
                completion = {
                    enabled = true,
                }
            }
        })
    end
}
