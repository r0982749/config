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
    filetypes = { 'yaml.docker-compose' },
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
    filetypes = { 'helm' },
    root_markers = { 'Chart.yaml', '.git' },
})

vim.lsp.enable({
    'gopls',
    'templ',
    'docker-compose-langserver',
    'docker-langserver',
    'golangci-lint-langserver',
    'helm_ls',
})
