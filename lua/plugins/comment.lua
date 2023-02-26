return {
    'numToStr/Comment.nvim',
    config = function ()
        require('Comment').setup()
        local opts = {silent = true,remap = true}
        vim.keymap.set('n','<leader>cc','gcc', opts);
        vim.keymap.set('v','<leader>cc','gc', opts);
    end,
}
