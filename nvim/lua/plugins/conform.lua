return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        opts = {
            formatters_by_ft = {
                go = { "golines" },
            },
            format_on_save = {
                timeout_ms = 2000,
                lsp_format = "fallback",
            },
        },
    },
}
