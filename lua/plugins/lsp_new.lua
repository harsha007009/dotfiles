return {
  -- Mason for LSP server management
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        "tsserver",
        "cssls", 
        "html",
        "tailwindcss-language-server",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },
}
