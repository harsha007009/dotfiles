
-- Disabled: Format only when manually requested
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     if vim.g.format_on_save then
--       require("conform").format({ async = false, lsp_fallback = true })
--     end
--   end,
--   desc = "Format on save if enabled",
-- })

