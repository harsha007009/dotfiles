
return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      trigger_events = { "InsertLeave", "TextChanged" },
      debounce_delay = 500, -- Increased from 135ms to 500ms (less frequent)
      condition = function(buf)
        -- Check if buffer is valid before accessing its properties
        if not vim.api.nvim_buf_is_valid(buf) then
          return false
        end
        -- Only auto-save normal files, not special buffers
        local filetype = vim.bo[buf].filetype
        local buftype = vim.bo[buf].buftype
        
        -- Skip certain filetypes and buffer types
        local skip_ft = { "gitcommit", "gitrebase", "alpha", "dashboard", "lazy", "mason" }
        if vim.tbl_contains(skip_ft, filetype) or buftype ~= "" then
          return false
        end
        
        return filetype ~= ""
      end,
      -- Mark when auto-save is happening to prevent formatting
      callbacks = {
        before_saving = function()
          vim.g.auto_save_in_progress = true
        end,
        after_saving = function()
          vim.g.auto_save_in_progress = false
        end,
      },
      -- Disable any formatting during auto-save
      execution_message = {
        message = function()
          return "" -- Silent auto-save
        end,
        dim = 0.0,
      },
    })
  end,
}
