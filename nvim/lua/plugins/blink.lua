return {
    'saghen/blink.cmp',
    dependencies = {
        'saghen/blink.lib',
    },
    opts = {
        cmdline = { enabled = false },
        keymap = { preset = 'default' },
        completion = { 
            keyword = { range = 'full' },
            accept = { auto_brackets = { enabled = false }, },
            documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = 'rounded' } },
            menu = {
                auto_show = true,
                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label' },
                    },
                },
            },
            ghost_text = { enabled = true }
        },
        sources = { default = { 'lsp', 'path', 'buffer' } },
        fuzzy = { implementation = 'rust' },
    },
    build = function()
        require("blink.cmp").build():pwait()
    end,
}

