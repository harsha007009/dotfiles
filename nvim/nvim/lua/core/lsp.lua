-- Simple LSP server setup - no duplicates
-- Note: Don't list servers here, let LazyVim handle LSP server management
-- We'll configure specific servers through their individual config files

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
