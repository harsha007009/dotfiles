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
        -- Use clang-format now that it's installed via Mason
        cpp = { "clang-format" },
        c = { "clang-format" },
      },
      
      -- Configure formatters
      formatters = {
        ["clang-format"] = {
          command = "clang-format",
          args = { "--style=file", "--fallback-style=llvm" },
          stdin = true,
          timeout_ms = 5000, -- Increase timeout to 5 seconds
        },
      },
      
      -- Disable automatic formatting for specific languages
      format_on_save = function(bufnr)
        -- Disable format on save for C/C++ files
        local filetype = vim.bo[bufnr].filetype
        if filetype == "cpp" or filetype == "c" then
          return false
        end
        return true
      end,
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
          -- Format with increased timeout and better error handling
          local ok, err = pcall(function()
            require("conform").format({ 
              async = false, -- Use synchronous formatting to avoid interruption
              timeout_ms = 5000, -- 5 second timeout
              lsp_fallback = true 
            })
          end)
          
          if not ok then
            vim.notify("Formatting failed: " .. tostring(err), vim.log.levels.WARN)
          end
          
          -- Save the file
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
      
      -- Also format on manual save (Ctrl+S or :w) - but respect language preferences
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          -- Only format on manual save, not auto-save
          if not vim.g.auto_save_in_progress then
            local filetype = vim.bo[args.buf].filetype
            -- Skip auto-formatting for C/C++ on save, only format when explicitly requested
            if filetype ~= "cpp" and filetype ~= "c" then
              require("conform").format({ bufnr = args.buf, lsp_fallback = true })
            end
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
