return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- Recommended basic config
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "Cargo.toml" },
      show_hidden = true,
      silent_chdir = true,
      scope_chdir = "global",
    }
    -- Keybinds for project management
    local map = vim.keymap.set
    map("n", "<leader>pa", function()
      require('telescope').extensions.projects.projects({})
      vim.notify("Select a project and press 'c' to add current dir as a project.", vim.log.levels.INFO)
    end, { desc = "Add Project (Telescope)" })
    map("n", "<leader>pd", function()
      require('telescope').extensions.projects.projects({})
      vim.notify("Select a project and press 'd' to delete.", vim.log.levels.INFO)
    end, { desc = "Delete Project (Telescope)" })
  end,
}