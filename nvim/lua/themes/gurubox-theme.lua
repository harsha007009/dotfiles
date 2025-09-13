return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true
      -- Default to medium background, you can change this
      vim.g.gruvbox_material_background = 'medium' -- Options: 'hard', 'medium', 'soft'
      vim.g.gruvbox_material_foreground = 'material' -- Options: 'material', 'mix', 'original'
      vim.g.gruvbox_material_transparent_background = 0 -- Set to 1 for transparency
      vim.g.gruvbox_material_visual = 'grey background' -- Options: 'grey background', 'green background', 'blue background', 'red background', 'reverse'
      vim.g.gruvbox_material_menu_selection_background = 'grey' -- Options: 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
    end
  }
}