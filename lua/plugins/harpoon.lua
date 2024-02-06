return {
    'ThePrimeagen/harpoon',
    lazy = true,
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        vim.api.nvim_set_keymap("n", "<leader>mw", "<cmd>lua require('harpoon.mark').add_file()<Cr>", { silent = true, noremap = true }),
        vim.api.nvim_set_keymap('n', '<leader>mt', '<cmd>Telescope harpoon marks<Cr>', { silent = true, noremap = true }),
        vim.api.nvim_set_keymap('n', '<leader>md', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<Cr>', { silent = true, noremap = true }),
        vim.api.nvim_set_keymap('n','<leader>mf', '<cmd>lua require("harpoon.ui").nav_next()<cr>',{silent = true, noremap = true}),
        vim.api.nvim_set_keymap('n','<leader>ma', '<cmd>lua require("harpoon.ui").nav_prev()<cr>',{silent = true, noremap = true}),
    },
    config = true;
}
