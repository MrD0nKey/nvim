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
g.t_co = 256
o.hlsearch = false
o.relativenumber = true
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.termguicolors = true
o.smartcase = true
o.incsearch = true
o.updatetime = 250
o.completeopt = 'menu,menuone,noselect'
o.splitright = true
o.splitbelow = true
o.mouse = 'a'
o.background = 'dark'
o.colorcolumn = '120'
o.smartindent = true
o.scrolloff = 4
o.encoding = 'utf8'
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
vim.wo.signcolumn = 'yes'
vim.wo.number = true

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

--General Keymaps
map('i', 'jk', '<Esc><Right>', opts)
map('n', '<leader>t', '<cmd>bnext<Cr>', opts)
map('n', '<leader>T', '<cmd>bprevious<Cr>', opts)
map('i', '{<Cr>', '{<Cr>}<Esc>O', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<leader>tt' , '<cmd>ToggleTerm size=30 direction=float<Cr>' , opts)
map('t', '<C-l>', '<cmd>ToggleTerm<Cr>', opts)

--Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

require"lazy".setup("plugins")
require"autocmds.init"

map('n','<leader>Sd','<cmd>SearchAndReplaceDoc<Cr>',opts)
