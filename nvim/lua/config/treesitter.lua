vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if ok then
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldenable = false
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
