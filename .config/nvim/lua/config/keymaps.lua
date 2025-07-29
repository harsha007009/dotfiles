local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🧠 Terminal mode window nav
keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)

-- Telescope find_files🖱️ Ctrl+A to select all text
keymap("n", "<C-a>", "ggVG", opts)
keymap("i", "<C-a>", "<Esc>ggVG", opts)
keymap("v", "<C-a>", "ggVG", opts)

-- 🪟 Split shortcuts
keymap("n", "sh", ":split<CR>", opts) -- Horizontal
keymap("n", "sv", ":vsplit<CR>", opts) -- Vertical

-- 🪜 Move lines in visual mode
keymap("x", "<S-j>", ":move '>+1<CR>gv=gv", opts) -- Down
keymap("x", "<S-k>", ":move '<-2<CR>gv=gv", opts) -- Up

-- 📜 Page navigation using Shift+H and Shift+L
keymap("n", "<S-h>", "<C-u>", opts) -- Page up
keymap("n", "<S-l>", "<C-d>", opts) -- Page down

-- 🧭 Buffer navigation (use Tab / Shift+Tab)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- 📖 Hover docs
keymap("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- 🏷️ Rename symbol
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- 📑 Document symbols
keymap("n", "<leader>cs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)

-- 🔍 LSP Go-to
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- ⎋ Escape from all modes using 'jk'
keymap("i", "jk", "<Esc>", opts)
keymap("v", "jk", "<Esc>", opts)
keymap("s", "jk", "<Esc>", opts)

-- 🎨 Manual formatting keybindings (while coding)
keymap("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Buffer" })
keymap("v", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Selection" })

-- Quick save without extra formatting (already formats on save)
keymap("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- 🔧 Completion and LSP Navigation Keybindings
-- These will be set up when nvim-cmp loads
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buffer = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    
    -- 📋 Completion menu navigation (when cmp is active)
    -- Ctrl+N/P for next/previous
    -- Ctrl+J/K for scrolling in documentation
    -- Tab/S-Tab for cycling through suggestions
    
    -- 🔍 LSP Hover and Documentation
    keymap("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover Documentation" })
    keymap("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature Help" })
    
    -- 🚀 LSP Actions
    keymap("n", "gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Go to Definition" })
    keymap("n", "gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Go to Declaration" })
    keymap("n", "gi", vim.lsp.buf.implementation, { buffer = buffer, desc = "Go to Implementation" })
    keymap("n", "gt", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Go to Type Definition" })
    keymap("n", "gr", vim.lsp.buf.references, { buffer = buffer, desc = "Show References" })
    
    -- 💡 Code Actions
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Actions" })
    keymap("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Actions" })
    keymap("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename Symbol" })
    keymap("n", "<leader>cf", function()
      vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
      })
    end, { buffer = buffer, desc = "Auto Fix" })
    
    -- 🔧 Diagnostics Navigation
    keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = buffer, desc = "Previous Diagnostic" })
    keymap("n", "]d", vim.diagnostic.goto_next, { buffer = buffer, desc = "Next Diagnostic" })
    keymap("n", "<leader>d", vim.diagnostic.open_float, { buffer = buffer, desc = "Show Line Diagnostics" })
    
    -- 🔍 Toggle inlay hints
    keymap("n", "<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { buffer = buffer, desc = "Toggle Inlay Hints" })
  end,
})

-- ⏲️ Set escape timeout
vim.o.timeout = true
vim.o.timeoutlen = 250
