local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🧠 Terminal mode window nav
keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)

-- � Disable Ctrl+N globally (except terminal-mode) so it doesn't move down or trigger completion
keymap({ "n", "i", "v", "x", "s", "o" }, "<C-n>", "<Nop>", { noremap = true, silent = true, desc = "Disable Ctrl+N" })

-- �🔍 Telescope keybindings
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })

-- 🔒 Toggle modifiable setting
keymap("n", "<leader>tm", function()
  if vim.bo.modifiable then
    vim.bo.modifiable = false
    vim.notify("Buffer is now read-only", vim.log.levels.INFO)
  else
    vim.bo.modifiable = true
    vim.notify("Buffer is now modifiable", vim.log.levels.INFO)
  end
end, { desc = "Toggle Modifiable" })

-- 🖱️ Ctrl+A to select all text
keymap("n", "<C-a>", "ggVG", opts)
keymap("i", "<C-a>", "<Esc>ggVG", opts)
keymap("v", "<C-a>", "ggVG", opts)

-- 💾 Ctrl+S to save + format (your main save keybind!)
keymap("n", "<C-s>", function()
  require("conform").format({ async = true, lsp_fallback = true })
  vim.cmd("write")
end, { desc = "Format and Save" })
keymap("i", "<C-s>", function()
  require("conform").format({ async = true, lsp_fallback = true })
  vim.cmd("write")
end, { desc = "Format and Save" })

-- 💾 Leader+fs to save + format
keymap("n", "<leader>fs", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  
  -- Debug: Check what formatters are available
  local formatters = require("conform").list_formatters(bufnr)
  vim.notify("Available formatters for " .. filetype .. ": " .. vim.inspect(formatters), vim.log.levels.INFO)
  
  local success = pcall(function()
    require("conform").format({ 
      bufnr = bufnr,
      async = true, 
      lsp_fallback = true,
      range = {
        start = { line = 0, character = 0 },
        ["end"] = { line = vim.api.nvim_buf_line_count(bufnr) - 1, character = 0 }
      }
    })
    vim.cmd("write")
  end)
  if not success then
    vim.notify("Format and save failed", vim.log.levels.WARN)
  else
    vim.notify("Formatted and saved successfully", vim.log.levels.INFO)
  end
end, { desc = "Format and Save" })
keymap("i", "<leader>fs", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  
  -- Debug: Check what formatters are available
  local formatters = require("conform").list_formatters(bufnr)
  vim.notify("Available formatters for " .. filetype .. ": " .. vim.inspect(formatters), vim.log.levels.INFO)
  
  local success = pcall(function()
    require("conform").format({ 
      bufnr = bufnr,
      async = true, 
      lsp_fallback = true,
      range = {
        start = { line = 0, character = 0 },
        ["end"] = { line = vim.api.nvim_buf_line_count(bufnr) - 1, character = 0 }
      }
    })
    vim.cmd("write")
  end)
  if not success then
    vim.notify("Format and save failed", vim.log.levels.WARN)
  else
    vim.notify("Formatted and saved successfully", vim.log.levels.INFO)
  end
end, { desc = "Format and Save" })

-- 🪟 Split shortcuts
keymap("n", "sh", ":split<CR>", opts) -- Horizontal
keymap("n", "sv", ":vsplit<CR>", opts) -- Vertical

-- 🪜 Move lines in visual mode
keymap("x", "<S-j>", ":move '>+1<CR>gv=gv", opts) -- Down
keymap("x", "<S-k>", ":move '<-2<CR>gv=gv", opts) -- Up

-- 📜 Page navigation using Ctrl+U and Ctrl+D
keymap("n", "<C-u>", "<C-u>", opts) -- Page up (default)
-- Removed normal-mode <C-d> mapping to free it for Visual Multi
-- keymap("n", "<C-d>", "<C-d>", opts) -- Page down (default)

-- 📜 Page navigation using Shift+H and Shift+L (like Ctrl+U and Ctrl+D)
keymap("n", "<S-h>", "<C-u>", opts) -- Page up with Shift+H
keymap("n", "<S-l>", "<C-d>", opts) -- Page down with Shift+L

-- 🧭 Buffer navigation (Tab/Shift-Tab AND Alt+h/l)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<A-l>", ":bnext<CR>", opts)     -- Alt+L for next buffer
keymap("n", "<A-h>", ":bprevious<CR>", opts) -- Alt+H for prev buffer

-- 📖 Hover docs
keymap("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- 🏷️ Rename symbol
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- 📑 Document symbols
keymap("n", "<leader>cs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)

-- 📋 LSP Symbol picker (like in the image)
keymap("n", "<leader>o", function()
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "LSP Symbols" })

-- 🔍 LSP Go-to
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- ⎋ Escape from all modes using 'jk'
keymap("i", "jk", "<Esc>", opts)
keymap("v", "jk", "<Esc>", opts)
keymap("s", "jk", "<Esc>", opts)

-- ⚡ Enable == for formatting (built-in indent formatting)
keymap("n", "==", "==", { desc = "Format Current Line" })
keymap("v", "=", "=", { desc = "Format Selection" })

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

-- � Save without formatting
keymap("n", "<C-s>", ":w<CR>", { desc = "Save File" })
keymap("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save File" })

-- �🔒 Toggle modifiable (read-only)
keymap("n", "<leader>tm", function()
  vim.bo.modifiable = not vim.bo.modifiable
  if vim.bo.modifiable then
    print("Buffer is now modifiable")
  else
    print("Buffer is now read-only")
  end
end, { desc = "Toggle Modifiable" })

-- 🎨 LazyVim built-in colorscheme switcher (with search!)
-- keymap("n", "<leader>tt", "<leader>uC", { desc = "LazyVim Colorscheme Switcher" })
-- Note: Use <leader>uC for LazyVim's built-in colorscheme switcher

-- ⏲️ Set escape timeout
vim.o.timeout = true
vim.o.timeoutlen = 250

-- Always enter visual block mode with Ctrl+V in all modes
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-v>", "<C-v>", { noremap = true, silent = true, desc = "Visual Block Mode" })
-- Some terminals intercept Ctrl+V (paste). Provide reliable fallbacks:
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-q>", "<C-v>", { noremap = true, silent = true, desc = "Visual Block Mode (Fallback)" })
vim.keymap.set({"n", "v", "x", "s", "o"}, "<M-v>", "<C-v>", { noremap = true, silent = true, desc = "Visual Block Mode (Alt+V)" })
