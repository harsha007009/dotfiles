return {
  "mg979/vim-visual-multi",
  lazy = false,
  init = function()
    -- Disable default mappings so <C-n> doesn't get claimed by Visual Multi
    vim.g.VM_default_mappings = 0
  -- Explicit mappings: use <C-d> for VSCode-style multi-cursor
  vim.g.VM_maps = vim.fn.eval('{"Find Under": "<C-d>", "Find Subword Under": "<C-d>"}')
  end,
}
