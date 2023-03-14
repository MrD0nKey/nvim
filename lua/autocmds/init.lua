vim.api.nvim_create_user_command("SearchAndReplaceDoc", function ()
    local wordToReplace = vim.fn.input "Which word you want to replace: "
    print("/n")
    local newWord = vim.fn.input "New Word to replace with: "
    print("/n")
    local confirmation = vim.fn.input "Do you want confirmation? (y/Yes or n/No): "
    print("/n")
    local confirmationString
    if confirmation == "y" then
       confirmationString = "c"
    else
        confirmationString = ""
    end

    vim.cmd(":%s/" .. wordToReplace .. "/" .. newWord .. "/g" .. confirmationString)
end, {})

vim.api.nvim_create_user_command("Keymaps", function ()
    vim.cmd(":Telescope keymaps")
end, {})

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map('n','<leader>sr','<cmd>SearchAndReplaceDoc<Cr>',opts)
