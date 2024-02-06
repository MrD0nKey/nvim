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

map('n','<leader>ec','<cmd>silent %w !pbcopy<Cr>',opts)


vim.api.nvim_create_user_command("ExecutePython", function ()

    local nameofFile = vim.fn.expand('%:t')
    if nameofFile then
        vim.cmd('silent %w !pbcopy')
        vim.cmd('TermExec size=70 direction=float cmd="python3 ' .. nameofFile .. '"<Cr>')
    end

end, {})

map('n', '<leader>ep', '<cmd>ExecutePython<Cr>',opts)
--local bufnr = 2

--vim.api.nvim_create_autocmd("BufWritePost", {
--    group = vim.api.nvim_create_augroup("Katniss", {clear =true}),
--    pattern = "*.py",
--    callback = function()
--        local x = {}
--        local nameofFile = vim.cmd("silent :echo expand('%:t')")
--        local isKat = function()
--            for str in string.gmatch(nameofFile, "/(_kat)/g") do
--                table.insert(x,str)
--            end
--        end
--        if x then
--            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false,{"Output:"})
--            vim.fn.jobstart({"python3",nameofFile},{
--                stdout_buffered = true,
--                on_stdout = function(_,data)
--                    if data then
--                        vim.api.nvim_buf_set_lines(bufnr, -1 , -1, false,data)
--                    end
--                end,
--                on_stderr = function(_,data)
--                    if data then
--                        vim.api.nvim_buf_set_lines(bufnr, -1 , -1, false,data)
--                    end
--                end,
--            })
--        end
--    end,
--})
