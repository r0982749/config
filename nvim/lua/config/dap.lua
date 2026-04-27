local dap = require("dap")
local dapui = require("dapui")

-- Delve (Go)
dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}

local function find_main_package()
    local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1] or vim.fn.getcwd()
    local files = vim.fn.systemlist("grep -rl 'package main' " .. root .. " --include='*.go'")
    local dirs, seen = {}, {}
    for _, f in ipairs(files) do
        local dir = vim.fn.fnamemodify(f, ":h")
        if not seen[dir] then
            seen[dir] = true
            table.insert(dirs, dir)
        end
    end
    if #dirs == 1 then
        return dirs[1]
    end
    local choices = { "Select main package:" }
    for i, d in ipairs(dirs) do
        table.insert(choices, i .. ". " .. vim.fn.fnamemodify(d, ":~:."))
    end
    return dirs[vim.fn.inputlist(choices)]
end

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = find_main_package,
    },
    {
        type = "delve",
        name = "Debug Current File",
        request = "launch",
        program = "${file}",
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
    },
}

-- UI
dapui.setup({
    expand_lines = false,
    layouts = {
        {
            elements = {
                { id = "console",     size = 0.15 },
                { id = "breakpoints", size = 0.20 },
                { id = "stacks",      size = 0.45 },
                { id = "watches",     size = 0.20 },
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                { id = "repl",   size = 0.35 },
                { id = "scopes", size = 0.65 },
            },
            size = 12,
            position = "bottom",
        },
    },
})

-- Auto open/close UI with DAP sessions
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Keymaps
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "DAP step out" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP toggle UI" })
vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "DAP terminate" })
