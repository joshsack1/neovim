return {
    {
        "JuliaEditorSupport/julia-vim",
        config = function()
            vim.g.latex_to_unicode_auto = 1
            vim.g.latex_to_unicode_tab = 0
        end,
    },
    {
        "kdheepak/JuliaFormatter.vim",
        config = function()
            vim.cmd[[
            let g:JuliaFormatter_options = {
            \ 'style' : 'blue',
            \}
            " Set <leader>jf to activate julia formatter
            noremap <leader>jf :JuliaFormatterFormat<CR>
            vnoremap <leader>jf :JuliaFormatterFormat<CR>
            let g:JuliaFormatter_always_launch_server=1
            ]]
        end,
    },
}
