vim.opt.completeopt = {'menu','menuone','noselect'}

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

local cmp = require'cmp'
--require
  cmp.setup({
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    view = {
        entries = 'custom'
    },
    formatting = {
        fields = {'kind','abbr','menu'},
        format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            -- This concatonates the icons with the name of the item kind
            -- Source
        vim_item.menu = ({
            buffer = "Buf",
            nvim_lsp = "LSP",
            luasnip = "LuaSP",
            nvim_lua = "Lua",
            latex_symbols = "Ltx",
        })[entry.source.name]
        return vim_item
        end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.select_next_item(),
        ['<C-n>'] = cmp.mapping.scroll_docs(-4),
        ['<C-p>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' }, -- For luasnip users.
        {
      { name = 'buffer', keyword_length = 5 , max_item_count = 10,}
        },
    })
  })

--Colors for completion

--gray
--highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--blue
--highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--light blue
--highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--pink
--highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--front
--highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4


