return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
	local treesitter = require('nvim-treesitter')
	treesitter.install({ 'go', 'gomod', 'gosum', 'make', 'markdown', 'dockerfile', 'json', 'templ', 'tsx', 'javascript' })
    end,
}
