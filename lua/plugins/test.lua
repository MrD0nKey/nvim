return {
    'vim-test/vim-test',
    config = function ()
        local opts = {silent = true, noremap = true}
        local map = vim.api.nvim_set_keymap

        map('n','<leader>tn','<cmd>TestNearest',opts)
        map('n','<leader>tf','<cmd>TestFile',opts)
        map('n','<leader>ts','<cmd>TestSuite',opts)
        map('n','<leader>tl','<cmd>TestLast',opts)
        map('n','<leader>tv','<cmd>TestVisit',opts)
    end
}
