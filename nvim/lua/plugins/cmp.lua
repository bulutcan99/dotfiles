return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "zbirenbaum/copilot-cmp", -- copilot entegrasyonu
    },
    opts = function()
        local cmp = require("cmp")
        local LazyVim = require("lazyvim.util")

        return {
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
                ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
                ["<S-CR>"] = LazyVim.cmp.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                }),
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
                ["<C-a>"] = function(fallback)
                    return LazyVim.cmp.map(
                        { "snippet_forward", "ai_accept" },
                        fallback
                    )()
                end,
            }),

            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "lazydev" },
                { name = "nvim_lsp" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),

            formatting = {
                format = function(entry, item)
                    local icons = LazyVim.config.icons.kinds
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end

                    local widths = {
                        abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                        menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                    }

                    for key, width in pairs(widths) do
                        if
                            item[key]
                            and vim.fn.strdisplaywidth(item[key]) > width
                        then
                            item[key] = vim.fn.strcharpart(
                                item[key],
                                0,
                                width - 1
                            ) .. "…"
                        end
                    end

                    return item
                end,
            },

            experimental = {
                ghost_text = vim.g.ai_cmp and {
                    hl_group = "CmpGhostText",
                } or false,
            },

            sorting = {
                priority_weight = 2,
                comparators = {
                    -- Copilot'u en üste al
                    function(entry1, entry2)
                        local copilot1 = entry1.source.name == "copilot"
                        local copilot2 = entry2.source.name == "copilot"
                        if copilot1 and not copilot2 then
                            return true
                        elseif copilot2 and not copilot1 then
                            return false
                        end
                    end,

                    -- Field'ları önce getir
                    function(entry1, entry2)
                        local kind1 = entry1:get_kind()
                        local kind2 = entry2:get_kind()
                        local field_kind = cmp.lsp.CompletionItemKind.Field
                        if kind1 == field_kind and kind2 ~= field_kind then
                            return true
                        elseif kind2 == field_kind and kind1 ~= field_kind then
                            return false
                        end
                    end,

                    -- Method'ları ikinci sıraya al
                    function(entry1, entry2)
                        local kind1 = entry1:get_kind()
                        local kind2 = entry2:get_kind()
                        local method_kind = cmp.lsp.CompletionItemKind.Method
                        if kind1 == method_kind and kind2 ~= method_kind then
                            return true
                        elseif
                            kind2 == method_kind and kind1 ~= method_kind
                        then
                            return false
                        end
                    end,

                    -- JetBrains tarzı sıralama
                    cmp.config.compare.exact,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }
    end,
    main = "lazyvim.util.cmp",
}
