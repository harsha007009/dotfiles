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
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },
                    -- Removed <C-n>/<C-p> to avoid conflicts and free <C-n>
                    ["<C-j>"] = { "select_next", "fallback" },
                    ["<C-k>"] = { "select_prev", "fallback" },
                    ["<C-y>"] = { "accept", "fallback" },
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    accept = {
                        auto_brackets = {
                            enabled = true,
                        },
                    },
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label", "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    ghost_text = {
                        enabled = true,
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                        keymap = {
                            ["<C-u>"] = { "scroll_documentation_up" },
                            -- Avoid <C-d> so Visual Multi can use it
                            ["<C-b>"] = { "scroll_documentation_up" },
                            ["<C-f>"] = { "scroll_documentation_down" },
                            ["<PageUp>"] = { "scroll_documentation_up" },
                            ["<PageDown>"] = { "scroll_documentation_down" },
                            ["<Up>"] = { "scroll_documentation_up" },
                            ["<Down>"] = { "scroll_documentation_down" },
                            ["<Esc>"] = { "hide_documentation" },
                            ["q"] = { "hide_documentation" },
                        },
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
