return {
    {
        'saghen/blink.cmp',
        version = '*',
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },
            completion = {
                accept = {
                    create_undo_point = true,
                    auto_brackets = { enabled = false },
                },
                menu = {
                    draw = {
                        columns = {
                            { 'kind_icon' },
                            { 'label', 'label_description', gap = 1 },
                        },
                    },
                },
            },
        },
    },
}
