return {
  -- Disable automatic formatting, only format on save and manual trigger
  {
    "stevearc/conform.nvim",
    opts = {
      -- Disable format on save by default
      format_on_save = false,
      
      -- Set up formatters
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
        objcpp = { "clang_format" },
      },
      -- Configure formatters with better timeout and error handling
      formatters = {
        prettier = {
          timeout_ms = 10000, -- Increase timeout to 10 seconds
          prepend_args = { "--tab-width", "2", "--print-width", "80" },
        },
        clang_format = {
          timeout_ms = 5000,
        },
        stylua = {
          timeout_ms = 5000,
        },
        stylua = {
          timeout_ms = 5000,
        },
      },
    },
    keys = {
      -- Manual format keybinding
      {
        "<leader>fm",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true,
            timeout_ms = 10000,
          }, function(err)
            if err then
              vim.notify("Format failed: " .. tostring(err), vim.log.levels.WARN)
            else
              vim.notify("File formatted successfully", vim.log.levels.INFO)
            end
          end)
        end,
        desc = "Format Document",
        mode = { "n", "v" },
      },
      {
        "<leader>fs",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true,
            timeout_ms = 10000,
          }, function(err)
            if err then
              vim.notify("Format failed: " .. tostring(err), vim.log.levels.WARN)
            else
              local success, save_err = pcall(vim.cmd, "write")
              if not success then
                vim.notify("Save failed: " .. tostring(save_err), vim.log.levels.WARN)
              else
                vim.notify("File formatted and saved", vim.log.levels.INFO)
              end
            end
          end)
        end,
        desc = "Format and Save",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
      
      -- Simple auto-save without formatting on buffer leave
      vim.api.nvim_create_autocmd("BufWinLeave", {
        pattern = "*",
        callback = function(args)
          local buf = args.buf
          if vim.bo[buf].modified and vim.bo[buf].buftype == "" then
            -- Just save, don't format automatically
            pcall(vim.cmd, "write")
          end
        end,
      })
    end,
  },

  -- Configure LSP to not format automatically
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Disable automatic formatting from LSP
      opts.format = { timeout_ms = 3000 }
      opts.format_on_save = false
      
      return opts
    end,
  },
}
