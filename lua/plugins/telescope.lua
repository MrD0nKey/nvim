local actions = require'telescope.actions'

local map = vim.api.nvim_set_keymap
local opts = { silent = true , noremap = true }

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["qq"] = actions.close,
        --["xj"] = actions.abort
      },
      n = {["qq"] = actions.close}
    }
  }
}

--Extensions
require'telescope'.load_extension('fzf')
require'telescope'.load_extension('project')

--Keymaps
map('n','ff','<cmd>lua require("telescope.builtin").find_files()<cr>',opts)
map('n','fb','<cmd>lua require("telescope.builtin").buffers()<cr>',opts)
map('n','fp','<cmd>lua require("telescope").extensions.project.project()<cr>',opts)

