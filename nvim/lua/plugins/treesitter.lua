return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            local treesitter = require('nvim-treesitter')
            treesitter.install({ 
                'go',
                'gomod',
                'gosum',
                'make',
                'markdown',
                'dockerfile',
                'json',
                'templ',
                'tsx',
                'javascript'
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            local treesitter = require('treesitter-context')
            treesitter.setup {
                enable = true,
                max_lines = 1,
                trim_scope = 'inner',
            }
            vim.keymap.set("n", "[c", function()
                treesitter.go_to_context(vim.v.count1)
            end, { silent = true })
        end
    }
}
