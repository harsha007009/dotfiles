return {
  -- Mason for LSP server management
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua-language-server",
        "clangd",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "tailwindcss-language-server",
        "eslint_d", -- ONLY this linter
      })
    end,
  },
}
