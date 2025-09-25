return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help", "terminal", "NvimTree", "toggleterm", "lazy" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors)
          -- Use the same colors throughout
          colors.bg = "#0F1014"
          colors.fg = "#868690"
          colors.bg_dark = "#0F1014"
          colors.bg_float = "#0F1014"
          colors.bg_highlight = "#1F1F24"
          colors.bg_popup = "#0F1014"
          colors.bg_search = "#373643"
          colors.bg_sidebar = "#0F1014"
          colors.bg_statusline = "#0F1014"
          colors.bg_visual = "#26262f"
          colors.border = "#43444D"
          colors.comment = "#43444D"
          colors.fg_dark = "#575861"
          colors.fg_float = "#868690"
          colors.fg_gutter = "#575861"
          colors.fg_sidebar = "#868690"

          -- Syntax colors
          colors.blue = "#8eb6f5"
          colors.blue1 = "#8eb6f5"
          colors.blue2 = "#8eb6f5"
          colors.blue5 = "#8eb6f5"
          colors.blue6 = "#8eb6f5"
          colors.blue7 = "#8eb6f5"

          colors.cyan = "#8eb6f5"
          colors.cyan1 = "#8eb6f5"
          colors.cyan2 = "#8eb6f5"
          colors.cyan3 = "#8eb6f5"
          colors.cyan4 = "#8eb6f5"
          colors.cyan5 = "#8eb6f5"
          colors.cyan6 = "#8eb6f5"
          colors.cyan7 = "#8eb6f5"

          colors.green = "#8eb6f5"
          colors.green1 = "#8eb6f5"
          colors.green2 = "#8eb6f5"
          colors.green3 = "#8eb6f5"
          colors.green4 = "#8eb6f5"
          colors.green5 = "#8eb6f5"
          colors.green6 = "#8eb6f5"
          colors.green7 = "#8eb6f5"

          colors.magenta = "#c58fff"
          colors.magenta1 = "#c58fff"
          colors.magenta2 = "#c58fff"
          colors.magenta3 = "#c58fff"
          colors.magenta4 = "#c58fff"
          colors.magenta5 = "#c58fff"
          colors.magenta6 = "#c58fff"
          colors.magenta7 = "#c58fff"

          colors.orange = "#ffbb88"
          colors.orange1 = "#ffbb88"
          colors.orange2 = "#ffbb88"
          colors.orange3 = "#ffbb88"
          colors.orange4 = "#ffbb88"
          colors.orange5 = "#ffbb88"
          colors.orange6 = "#ffbb88"
          colors.orange7 = "#ffbb88"

          colors.pink = "#f58ee0"
          colors.pink1 = "#f58ee0"
          colors.pink2 = "#f58ee0"
          colors.pink3 = "#f58ee0"
          colors.pink4 = "#f58ee0"
          colors.pink5 = "#f58ee0"
          colors.pink6 = "#f58ee0"
          colors.pink7 = "#f58ee0"

          colors.purple = "#c58fff"
          colors.purple1 = "#c58fff"
          colors.purple2 = "#c58fff"
          colors.purple3 = "#c58fff"
          colors.purple4 = "#c58fff"
          colors.purple5 = "#c58fff"
          colors.purple6 = "#c58fff"
          colors.purple7 = "#c58fff"

          colors.red = "#f58ee0"
          colors.red1 = "#f58ee0"
          colors.red2 = "#f58ee0"
          colors.red3 = "#f58ee0"
          colors.red4 = "#f58ee0"
          colors.red5 = "#f58ee0"
          colors.red6 = "#f58ee0"
          colors.red7 = "#f58ee0"

          colors.teal = "#8eb6f5"
          colors.teal1 = "#8eb6f5"
          colors.teal2 = "#8eb6f5"
          colors.teal3 = "#8eb6f5"
          colors.teal4 = "#8eb6f5"
          colors.teal5 = "#8eb6f5"
          colors.teal6 = "#8eb6f5"
          colors.teal7 = "#8eb6f5"

          colors.yellow = "#ffbb88"
          colors.yellow1 = "#ffbb88"
          colors.yellow2 = "#ffbb88"
          colors.yellow3 = "#ffbb88"
          colors.yellow4 = "#ffbb88"
          colors.yellow5 = "#ffbb88"
          colors.yellow6 = "#ffbb88"
          colors.yellow7 = "#ffbb88"

          colors.gray = "#9898a6"
          colors.gray1 = "#9898a6"
          colors.gray2 = "#9898a6"
          colors.gray3 = "#9898a6"
          colors.gray4 = "#9898a6"
          colors.gray5 = "#9898a6"
          colors.gray6 = "#9898a6"
          colors.gray7 = "#9898a6"

          colors.white = "#fdfdfe"
          colors.white1 = "#fdfdfe"
          colors.white2 = "#fdfdfe"
          colors.white3 = "#fdfdfe"
          colors.white4 = "#fdfdfe"
          colors.white5 = "#fdfdfe"
          colors.white6 = "#fdfdfe"
          colors.white7 = "#fdfdfe"
        end,
        on_highlights = function(hl, c)
          -- Ensure all NvimTree highlights use the same background
          hl.NvimTreeNormal = { fg = c.fg, bg = c.bg }
          hl.NvimTreeNormalNC = { fg = c.fg, bg = c.bg }
          hl.NvimTreeEndOfBuffer = { fg = c.bg, bg = c.bg }
          hl.NvimTreeVertSplit = { fg = c.border, bg = c.bg }
          hl.NvimTreeWinSeparator = { fg = c.border, bg = c.bg }
          hl.NvimTreeCursorLine = { bg = c.bg_highlight }
          hl.NvimTreeCursorLineNr = { fg = c.fg, bg = c.bg_highlight }
          hl.NvimTreeRootFolder = { fg = c.blue, bg = c.bg }
          hl.NvimTreeFolderName = { fg = c.blue, bg = c.bg }
          hl.NvimTreeOpenedFolderName = { fg = c.blue, bg = c.bg }
          hl.NvimTreeEmptyFolderName = { fg = c.gray, bg = c.bg }
          hl.NvimTreeSymlink = { fg = c.orange, bg = c.bg }
          hl.NvimTreeExecFile = { fg = c.blue, bg = c.bg }
          hl.NvimTreeSpecialFile = { fg = c.white, bg = c.bg }
          hl.NvimTreeImageFile = { fg = c.purple, bg = c.bg }
          hl.NvimTreeGitDirty = { fg = c.orange, bg = c.bg }
          hl.NvimTreeGitStaged = { fg = c.blue, bg = c.bg }
          hl.NvimTreeGitNew = { fg = c.blue, bg = c.bg }
          hl.NvimTreeGitDeleted = { fg = c.red, bg = c.bg }
          hl.NvimTreeBookmark = { fg = c.orange, bg = c.bg }
          hl.NvimTreeIndentMarker = { fg = c.border, bg = c.bg }
          hl.NvimTreeWindowPicker = { fg = c.fg, bg = c.bg_highlight }

          -- Ensure consistent statusline
          hl.StatusLine = { fg = c.fg, bg = c.bg }
          hl.StatusLineNC = { fg = c.fg_dark, bg = c.bg }

          -- Ensure consistent line numbers
          hl.LineNr = { fg = c.fg_gutter, bg = c.bg }
          hl.CursorLineNr = { fg = c.fg, bg = c.bg }

          -- Ensure consistent cursor line
          hl.CursorLine = { bg = c.bg_cursor_line }
          hl.CursorColumn = { bg = c.bg_cursor_line }
        end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
