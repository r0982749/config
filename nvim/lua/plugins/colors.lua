return {
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').setup({})
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
                section_separators = '',
                component_separators = '│',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'diagnostics' },
                lualine_y = {},
                lualine_z = { 'location' },
            },
            extensions = { 'neo-tree' },
        }
    },
}
