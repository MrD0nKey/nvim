return {
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn["mkdp#util#install"]()
        end
    },
    {
        'lervag/vimtex',
        config = function()
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_general_viewer = "skim"
            vim.g.vimtex_view_forward_search_on_start = false
            vim.g.vimtex_toc_config = {
                mode = 1,
                fold_enable = 0,
                hide_line_numbers = 1,
                resize = 0,
                refresh_always = 1,
                show_help = 0,
                show_numbers = 1,
                split_pos = 'leftabove',
                split_width = 30,
                tocdeth = 3,
                indent_levels = 1,
                todo_sorted = 1,
            }
        end
    }
}
