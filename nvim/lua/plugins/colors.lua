return {
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').setup({
                overrides = {
                    LineNr = { fg = '#8b91b0' },
                    Cursor = { fg = '#1f2430', bg = '#419fff' },
                    TroubleCursorLine = { bg = '#18354c' },
                }
            })
            vim.cmd.colorscheme "ayu-mirage"
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
                lualine_y = { 'branch' },
                lualine_z = { 'location' },
            },
            extensions = { 'neo-tree' },
        }
    },
}
