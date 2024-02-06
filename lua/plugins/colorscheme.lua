return {
    {
        "nyoom-engineering/oxocarbon.nvim", priority = 1000,
        config = function()
            vim.cmd.colorscheme('oxocarbon')
            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
            vim.opt.termguicolors = true
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
    },
}
