-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Tab and indentation settings
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.tabstop = 4            -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4         -- Number of spaces for indentation
vim.opt.softtabstop = 4        -- Number of spaces for tab in insert mode
vim.opt.smartindent = true     -- Smart autoindenting

-- Hide tab characters and other whitespace
vim.opt.list = false           -- Don't show invisible characters like tabs
vim.opt.listchars = {          -- If list is enabled, use better characters
  tab = "  ",                  -- Show tabs as spaces instead of arrows/dashes
  trail = "·",                 -- Show trailing spaces as dots
  extends = "→",               -- Show when line extends beyond screen
  precedes = "←",              -- Show when line starts before screen
  nbsp = "␣"                   -- Show non-breaking spaces
}
