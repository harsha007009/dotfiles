return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = {
                    ["<C-f>"] = {},
                    -- Better completion navigation
                    ["<C-n>"] = { "select_next", "fallback" },
                    ["<C-p>"] = { "select_prev", "fallback" },
                    ["<C-j>"] = { "scroll_documentation_down", "fallback" },
                    ["<C-k>"] = { "scroll_documentation_up", "fallback" },
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    -- Enter key accepts current selection or selects first if none selected
                    ["<CR>"] = { "accept", "select_and_accept", "fallback" },
                    ["<C-e>"] = { "cancel", "fallback" },
                    -- Allow clicking with mouse
                    ["<LeftMouse>"] = { "accept", "fallback" },
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    menu = {
                        border = "rounded",
                        scrolloff = 1,
                        scrollbar = true,
                        -- Enable mouse support for clicking on suggestions
                        auto_show = true,
                        -- Auto-select first item in completion menu
                        selection = "auto_insert",
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label", "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = "rounded",
                            scrollbar = true,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                            -- Make documentation window focusable and scrollable
                            focusable = true,
                        },
                        auto_show = true,
                        auto_show_delay_ms = 300,
                    },
                    -- Enable mouse support for completion
                    accept = {
                        auto_brackets = {
                            enabled = true,
                        },
                        -- Create undo point before accepting completion
                        create_undo_point = true,
                    },
                    ghost_text = {
                        enabled = true,
                    },
                    -- Trigger completion automatically
                    trigger = {
                        signature_help = {
                            enabled = true,
                            blocked_trigger_characters = {},
                        },
                        completion = {
                            -- Show completion menu automatically after typing
                            keyword_length = 1,
                            blocked_trigger_characters = { " ", "\n", "\t" },
                        },
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
