
-- Disabled: Format only when manually requested
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     if vim.g.format_on_save then
--       require("conform").format({ async = false, lsp_fallback = true })
--     end
--   end,
--   desc = "Format on save if enabled",
-- })

-- Ensure proper filetype detection for C/C++ files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.cpp", "*.hpp", "*.cc", "*.cxx", "*.c++", "*.h", "*.hh"},
  callback = function()
    vim.bo.filetype = "cpp"
  end,
  desc = "Set filetype for C++ files",
})

-- Ensure C files are detected properly
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.c"},
  callback = function()
    vim.bo.filetype = "c"
  end,
  desc = "Set filetype for C files",
})

-- Save colorscheme changes persistently
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local colorscheme = vim.g.colors_name
    if colorscheme then
      -- Save to a simple file
      local config_dir = vim.fn.stdpath("config")
      local colorscheme_file = config_dir .. "/lua/config/last_colorscheme.lua"
      local file = io.open(colorscheme_file, "w")
      if file then
        file:write('vim.cmd("colorscheme ' .. colorscheme .. '")\n')
        file:close()
      end
    end
  end,
  desc = "Save colorscheme changes",
})
