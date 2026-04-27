vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gosum' },
    root_markers = { 'go.work', 'go.mod', '.git' },
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

vim.lsp.config('vscode-eslint-language-server', {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
    root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', '.eslintrc.cjs', 'package.json', '.git' },
    settings = {
        validate = 'on',
        rulesCustomizations = {},
        run = 'onType',
        nodePath = '',
        experimental = {
            useFlatConfig = false,
        },
        workingDirectory = { mode = 'location' },
    },
})

vim.lsp.config('tailwindcss-language-server', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'templ' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs', 'package.json', '.git' },
})

vim.lsp.config('vtsls', {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    end,
})

vim.lsp.enable({
    'gopls',
    'templ',
    'docker-compose-langserver',
    'docker-langserver',
    'golangci-lint-langserver',
    'helm_ls',
    'vscode-eslint-language-server',
    'tailwindcss-language-server',
    'vtsls',
})
