return {
    {
        "crusj/bookmarks.nvim",
        branch = "main",
        event = "VimEnter",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("bookmarks").setup({
                keymap = {
                    toggle = "<tab><tab>",
                    add = "mm",
                    delete_on_virt = "<leader>mm",
                    close = "q",
                    jump = "<CR>",
                    delete = "dd",
                    focus_tags = "<nop>",
                    focuc_bookmarks = "<nop>",
                    order = "<space><space>",
                },
                tags_ratio   = 0,
                virt_pattern = { "*" },
                sign_icon    = "",
                fix_enable   = true,
                hl = {
                    cursorline = "guibg=#18354c guifg=White",
                },
            })

            local marks = require("bookmarks.marks")
            local orig_set_marks = marks.set_marks
            marks.set_marks = function(buf, bmarks)
                local cfg = require("bookmarks.config").data
                local orig_virt = cfg.virt_text
                cfg.virt_text = ""

                local orig_descs = {}
                for i, mark in ipairs(bmarks) do
                    local text = (orig_virt ~= "" and orig_virt or mark.description) or ""
                    orig_descs[i] = mark.description
                    mark.description = "//" .. text
                end

                orig_set_marks(buf, bmarks)

                cfg.virt_text = orig_virt
                for i, mark in ipairs(bmarks) do
                    mark.description = orig_descs[i]
                end
            end

            local w = require("bookmarks.window")
            w.open_tags = function() end
            w.write_tags = function() end

            require("telescope").load_extension("bookmarks")

            local data = require("bookmarks.data")
            vim.api.nvim_create_autocmd("WinEnter", {
                callback = function()
                    local cw = vim.api.nvim_get_current_win()
                    local is_bookmark_win = vim.tbl_contains({ data.bufbw, data.bufpw }, cw)
                    if not is_bookmark_win and
                        data.bufbw ~= nil and
                        vim.api.nvim_win_is_valid(data.bufbw) then
                        require("bookmarks").close_bookmarks()
                    end
                end,
            })
        end,
    },
}
