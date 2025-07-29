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
      },
    },
    keys = {
      -- Manual format keybinding
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format Document",
        mode = { "n", "v" },
      },
      -- Auto-save with format keybinding
      {
        "<leader>fs",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
          vim.cmd("write")
        end,
        desc = "Format and Save",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
      
      -- Format when closing buffer/file (but not while coding)
      vim.api.nvim_create_autocmd("BufWinLeave", {
        pattern = "*",
        callback = function(args)
          local buf = args.buf
          if vim.bo[buf].modified and vim.bo[buf].buftype == "" then
            -- Format before closing if file was modified
            require("conform").format({ bufnr = buf, lsp_fallback = true })
          end
        end,
      })
      
      -- Also format on manual save (Ctrl+S or :w)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          -- Only format on manual save, not auto-save
          if not vim.g.auto_save_in_progress then
            require("conform").format({ bufnr = args.buf, lsp_fallback = true })
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
