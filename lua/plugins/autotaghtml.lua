return {
    'windwp/nvim-ts-autotag',
    build = function ()
        require('nvim-ts-autotag').setup()
    end
}
