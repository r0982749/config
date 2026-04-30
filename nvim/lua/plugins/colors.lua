return {
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            require('catppuccin').setup({ 
                flavor = "mocha",
                custom_highlights = function(colors)
                    return {
                        LineNr = { fg = colors.overlay1 },
                        CursorLineNr = { fg = colors.yellow, style = { "bold" } },
                        GitSignsAdd = { fg = colors.green },
                        GitSignsChange = { fg = colors.yellow },
                        GitSignsDelete = { fg = colors.red },
                    }
                end
            })
            vim.cmd.colorscheme "catppuccin-nvim"
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'ayu_mirage',
            options = {
                globalstatus = true,
                section_separators = '',
                component_separators = '│',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'diagnostics' },
                lualine_y = {},
                lualine_z = { 'location' },
            },
            extensions = { 'neo-tree' },
        }
    },
}
