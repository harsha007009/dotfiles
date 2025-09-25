return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "base16-vesper",
          "base16-black-metal",
          "base16-gruvbox-material-dark-medium",
        },
        livePreview = true,
        themeConfigFile = vim.fn.stdpath("config") .. "/lua/config/last_colorscheme.lua",
      })
      vim.keymap.set("n", "<leader>tu", ":Themery<CR>", { desc = "Open Themery theme picker" })
    end
  }