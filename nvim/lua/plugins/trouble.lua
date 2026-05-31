return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {
        focus = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = false,
        open_no_results = true,
        keys = {
            ["<cr>"] = "jump_close",
        },
        modes = {
            diagnostics_float = {
                mode = "diagnostics",
                filter = function(items)
                    local cwd = vim.uv.cwd()
                    return vim.tbl_filter(function(item)
                        return item.filename:find(cwd, 1, true) ~= nil
                    end, items)
                end,
                win = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Diagnostics",
                    title_pos = "center",
                    size = { width = 0.30, height = 0.4 },
                    position = { 0.5, 0.25 },
                    wo = {
                        winhighlight = "CursorLine:TroubleCursorLine",
                    },
                },
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    size = { width = 0.35, height = 0.4 },
                    position = { 0.5, 0.75 },
                },
            },
        },
    },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics_float toggle<cr>",
            desc = "Diagnostics (Trouble)"
        },
    },
    config = function(_, opts)
        require("trouble").setup(opts)
    end,
}
