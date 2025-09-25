return {
  -- Mason for LSP server management
  {
  "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua-language-server",
        "clangd",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "tailwindcss-language-server",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Configure individual LSP servers
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        tsserver = {
          settings = {
            typescript = {
              format = {
                enable = true,
              },
              validate = {
                enable = true,
              },
            },
          },
        },
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
        cssls = {},
        html = {},
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "tw`([^`]*)",
                  "tw=\"([^\"]*)",
                  "tw={\"([^\"}]*)",
                  "tw\\.\\w+`([^`]*)",
                  "tw\\(.*?\\)`([^`]*)",
                },
              },
            },
          },
        },
      },
    },
  },
}
