return {
  {
    "erl-koenig/theme-hub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Optional: for themes that use lush (will be notified if a theme requires it)
      -- "rktjmp/lush.nvim"
    },
    config = function()
      require("theme-hub").setup({
        -- Save downloaded themes to themes/ directory
        install_dir = vim.fn.stdpath("config") .. "/lua/themes",
        -- Auto-install themes when selected in browser
        auto_install_on_select = true,
        -- Auto-apply theme after installation
        apply_after_install = true,
        -- Don't use persistent since we have our own persistence system
        persistent = false,
      })
    end,
  },
}
