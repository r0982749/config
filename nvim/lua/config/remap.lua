vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
            vim.api.nvim_win_close(win, false)
        end
    end
end)

vim.keymap.set("i", "<C-h>", "<nop>")
vim.keymap.set("i", "<C-j>", "<nop>")
vim.keymap.set("i", "<C-k>", "<nop>")
vim.keymap.set("i", "<C-l>", "<nop>")

vim.keymap.set("n", "<C-w>", "<cmd>close<CR>", { nowait = true })
vim.keymap.set("n", "<C-s>", "<cmd>vsplit<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-e>", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '[e', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)




local function zoxide_complete(arg_lead, cmd_line, cursor_pos)
    local result = vim.fn.system('zoxide query --list ' .. vim.fn.shellescape(arg_lead))
    
    if vim.v.shell_error == 0 and result ~= '' then
        local paths = {}
        for path in result:gmatch("[^\r\n]+") do
            table.insert(paths, path)
        end
        return paths
    end
    
    return vim.fn.getcompletion(arg_lead, 'dir')
end

vim.api.nvim_create_user_command('Cd', function(opts)
    local result = vim.fn.system('zoxide query ' .. vim.fn.shellescape(opts.args)):gsub('\n', '')

    if vim.v.shell_error == 0 and result ~= '' then
        vim.fn.chdir(result)

        local last_file = nil
        for _, item in ipairs(vim.v.oldfiles) do
            if item:sub(1, #result) == result and vim.fn.filereadable(item) == 1 then
                last_file = item
                break
            end
        end

        if last_file then
            vim.cmd('edit ' .. vim.fn.fnameescape(last_file))
        else
            vim.cmd('enew')
        end

        print('Changed directory to: ' .. result)
    else
        print('Zoxide failed to change the directory...')
    end

    vim.fn.system('zoxide add ' .. vim.fn.shellescape(vim.fn.getcwd()))
end, { nargs = '?', complete = zoxide_complete })

vim.cmd('cabbrev cd Cd')



vim.api.nvim_create_user_command("Open", function()
    local manager = require("neo-tree.sources.manager")
    local state = manager.get_state("filesystem")
    local node = state.tree:get_node()
    local path = node:get_id()
    vim.fn.jobstart({ "open", "-R", path }, { detach = true })
end, { desc = "Reveal file in Finder" })

vim.cmd('cabbrev open Open')
