-- Simple LSP server setup - no duplicates
local lsp_servers = {
    "lua_ls",
    "clangd", 
    "ts_ls",        -- Single TypeScript server (replaces both js and tsserver)
    "cssls",
    "html",
    "tailwindcss",
}

-- Use LazyVim's built-in LSP setup instead of custom configs
require("lazyvim.util").lsp.setup()

-- Just enable TypeScript server directly
vim.lsp.config.ts_ls = {
  settings = {
    typescript = {
      inlayHints = { enabled = false },
    },
    javascript = {
      inlayHints = { enabled = false },
    },
  },
}

-- Enable the servers
vim.lsp.enable(lsp_servers)

-- Disable inlay hints to prevent errors
vim.lsp.inlay_hint.enable(false)

-- Enhanced diagnostic configuration
vim.diagnostic.config({
    virtual_lines = false, -- Set to true if you want virtual lines
    virtual_text = {
        prefix = "●",
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
        focusable = false,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
