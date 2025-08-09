return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      
      -- Only ESLint for pure JavaScript files
      -- TypeScript files get everything from LSP (no separate linter needed)
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        -- No linters for TypeScript - LSP handles everything
      }
      
      -- Simple linting on save only
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
} 