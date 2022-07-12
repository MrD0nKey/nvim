call plug#begin('~/.config/nvim/plugged')

"LSP config
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

"Colorscheme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'bluz71/vim-nightfly-guicolors'

"Lualine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'

"Luasnip
"For luasnip users.
Plug 'L3MON4D3/LuaSnip' 
Plug 'saadparwaiz1/cmp_luasnip'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'

"Colorizer
Plug 'norcalli/nvim-colorizer.lua'

Plug 'folke/todo-comments.nvim'
Plug 'romgrk/barbar.nvim'
call plug#end()

"colorscheme vim-monokai-tasty
set mouse=a
syntax on
set number
set relativenumber
set termguicolors
colorscheme nightfly
set completeopt=menu,menuone,noselect
"Options for spliting
set splitright
set splitbelow

lua << EOF
require'globals'
require'vars'
require'keymaps'
require'plugins/lualine'
require'plugins/nvim-lsp-installer'
require'plugins/nvim-treesitter'
require'plugins/nvim-lsp-config'
require'plugins/nvim-cmp'
require'plugins/colorizer'
require'plugins/telescope'
require'plugins/todo'
require'plugins/tabbar'
EOF

"Testing mac ssh
