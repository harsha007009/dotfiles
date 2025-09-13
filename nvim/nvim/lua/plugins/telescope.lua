return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim", -- For code actions UI
    },
    opts = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      })
      
      -- Configure extensions
      opts.extensions = opts.extensions or {}
      opts.extensions["ui-select"] = {
        require("telescope.themes").get_dropdown({
          previewer = false,
          initial_mode = "normal",
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              width = 0.5,
              height = 0.4,
              preview_width = 0.6,
            },
          },
        })
      }
      
      return opts
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      
      -- Load ui-select extension for code actions
      telescope.load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}
