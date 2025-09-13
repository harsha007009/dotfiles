-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load saved colorscheme and set colorscheme after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Load saved colorscheme first
    pcall(require, "config.last_colorscheme")
    
    -- Only set default if no colorscheme is set
    if vim.g.colors_name == nil then
      local success = pcall(vim.cmd.colorscheme, "everblush")
      if not success then
        pcall(vim.cmd.colorscheme, "habamax")
      end
    end
  end,
})

