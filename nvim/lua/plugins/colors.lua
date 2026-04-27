return {
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').setup({})
            vim.cmd.colorscheme "ayu-mirage"
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#8b9ab0' })
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#8b9ab0' })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#8b9ab0' })
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
