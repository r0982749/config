return {
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        'sphamba/smear-cursor.nvim',
        opts = {
            cursor_color = '#419fff',
        },
    }
}
