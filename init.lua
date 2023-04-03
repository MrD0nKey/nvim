local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local o = vim.opt
local g = vim.g

g.mapleader = ","
g.maplocalleader = ','

g.tex_flavor = "latex"

g.t_co = 256
o.termguicolors = true
o.background = 'dark'
o.colorcolumn = '120'

o.hlsearch = false
o.incsearch = true

o.relativenumber = true
o.breakindent = true
o.undofile = true

o.ignorecase = true
o.smartcase = true

o.updatetime = 250
o.completeopt = 'menu,menuone,noselect'

o.splitright = true
o.splitbelow = true

o.mouse = 'a'

o.encoding = 'utf8'
o.smartindent = true
o.scrolloff = 8
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

vim.wo.signcolumn = 'yes'

vim.wo.number = true

vim.cmd("syntax on")

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }


--General Keymaps
map('i', 'jk', '<Esc><Right>', opts)
map('n', '<leader>n', '<cmd>bnext<Cr>', opts)
map('n', '<leader>p', '<cmd>bprevious<Cr>', opts)
map('i', '{<Cr>', '{<Cr>}<Esc>O', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<leader>tt', '<cmd>ToggleTerm size=30 direction=float<Cr>', opts)
map('n', '<leader>tg', '<cmd>TermExec size=70 direction=float cmd="lazygit"<Cr>', opts)
map('t', '<C-l>', '<cmd>ToggleTerm<Cr>', opts)
map('n', '<C-t>', '<cmd>ToggleTerm<Cr>', opts)

--Indentation
map('v','<','<gv',opts)
map('v','>','>gv',opts)

--Window Navigation
map('n','<C-h>','<C-w>h',opts)
map('n','<C-l>','<C-w>l',opts)
map('n','<C-k>','<C-w>k',opts)
map('n','<C-j>','<C-w>j',opts)

--Rezising Windows
map('n','<S-Left>','<C-w>2>',opts)
map('n','<S-Right>','<C-w>2<',opts)
map('n','<S-Up>','<C-w>2+',opts)
map('n','<S-Down>','<C-w>2-',opts)

--Prime keymap dont remember
map('x','<leader>P',"\"_dP",opts)

--Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

-- Setup of Plugins
require "lazy".setup("plugins")
require "autocmds.init"
