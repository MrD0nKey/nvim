return {
    'fedepujol/move.nvim',
    config = function()
        local opts = { noremap = true, silent = true }
        -- Normal-mode commands
        vim.keymap.set('n', '<C-n>', ':MoveLine(1)<CR>', opts)
        vim.keymap.set('n', '<C-p>', ':MoveLine(-1)<CR>', opts)

        -- Visual-mode commands
        vim.keymap.set('v', '<C-n>', ':MoveBlock(1)<CR>', opts)
        vim.keymap.set('v', '<C-p>', ':MoveBlock(-1)<CR>', opts)
    end
}
