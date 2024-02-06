-- return {"nyoom-engineering/oxocarbon.nvim", priority = 1000,
--     config = function()
--         vim.cmd.colorscheme('oxocarbon')
--         vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--         vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
--         vim.opt.termguicolors = true
--     end,
-- }
return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            -- Recommended - see "Configuring" below for more config options
            transparent = true,
            italic_comments = true,
            hide_fillchars = false,
            borderless_telescope = true,
        })
        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
}
