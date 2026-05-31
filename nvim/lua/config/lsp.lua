local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })

        vim.api.nvim_create_autocmd('CursorHold', {
            buffer = args.buf,
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false, border = 'rounded', header = '', prefix = '- ' })
            end,
        })
    end,
})



vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gosum' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            buildFlags = { '-tags=e2e' },
        },
    },
})

vim.lsp.config('templ', {
    cmd = { 'templ', 'lsp' },
    filetypes = { 'templ' },
    root_markers = { 'go.work', 'go.mod', '.git' },
})

vim.lsp.config('docker-compose-langserver', {
    cmd = { 'docker-compose-langserver', '--stdio' },
    filetypes = { 'yaml' },
    root_markers = { 'docker-compose.yml', 'docker-compose.yaml', '.git' },
})

vim.lsp.config('docker-langserver', {
    cmd = { 'docker-langserver', '--stdio' },
    filetypes = { 'dockerfile' },
    root_markers = { 'Dockerfile', '.git' },
})

vim.lsp.config('golangci-lint-langserver', {
    cmd = { 'golangci-lint-langserver' },
    filetypes = { 'go' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    init_options = {
        command = { 'golangci-lint', 'run', '--output.json.path', 'stdout', '--show-stats=false', '--issues-exit-code=1' },
    },
})

vim.lsp.config('helm_ls', {
    cmd = { 'helm_ls', 'serve' },
    filetypes = { 'yaml' },
    root_markers = { 'Chart.yaml', '.git' },
})

vim.lsp.config('tailwindcss-language-server', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'templ' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs', 'package.json', '.git' },
})

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
})

vim.lsp.enable({
    'gopls',
    'templ',
    'docker-compose-langserver',
    'docker-langserver',
    'golangci-lint-langserver',
    'helm_ls',
    'tailwindcss-language-server',
    'ts_ls',
    'lua_ls',
})
