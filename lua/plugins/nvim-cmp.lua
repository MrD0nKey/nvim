return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp' , 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path'
    },
    config = function()
        -- nvim-cmp setup
        local cmp = require 'cmp'
        --local luasnip = require 'luasnip'
        local kind_icons = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "α",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "⟆",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }

        cmp.setup {
            snippet = {
                expand = function(args)
                    --luasnip.lsp_expand(args.body)
                end,
            },
            view = {
                entries = 'custom'
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = ({
                        buffer = "Buf",
                        nvim_lsp = "LSP",
                        luasnip = "LSnip",
                        nvim_lua = "Lua",
                        latex_symbols = "Ltx"
                    })[entry.source.name]
                    return vim_item
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.select,
                    select = true,
                },
                --['<C-n>'] = cmp.mapping(function(fallback)
                --    if cmp.visible() then
                --        cmp.select_next_item()
                --    elseif luasnip.expand_or_jumpable() then
                --        luasnip.expand_or_jump()
                --    else
                --        fallback()
                --    end
                --end, { 'i', 's' }),
                --['<C-p>'] = cmp.mapping(function(fallback)
                --    if cmp.visible() then
                --        cmp.select_prev_item()
                --    elseif luasnip.jumpable(-1) then
                --        luasnip.jump(-1)
                --    else
                --        fallback()
                --    end
                --end, { 'i', 's' }),
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp' , keyword_length = 2, max_item_count = 20},
                { name = 'nvim_lua' , keyword_length = 2, max_item_count = 20}, -- For luasnip users.
                { name = 'luasnip' , keyword_length = 2, max_item_count = 20},
                { name = 'buffer', keyword_length = 3, max_item_count = 20},
            },
        }
    end,
}
