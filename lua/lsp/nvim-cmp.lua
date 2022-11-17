local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
    -- 设置代码片段引擎，用于根据代码片段补全
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anymous"](args.body)
        end,
    },

    window = {
    },

    mapping = {
        -- 选择上一个
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- 选择下一个
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消补全
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- 确认使用某个补全项
        ['<Tab>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),

        -- 向上翻页
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        -- 向下翻页
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        --     end
        -- end, { "i", "s" }),

        -- ["<C-Tab>"] = cmp.mapping(function()
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     end
        -- end, { "i", "s" }),
    },

    -- 补全来源
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
        {name = 'buffer'},
        {name = 'path'}
    }),

    ----根据文件类型来选择补全来源
    --cmp.setup.filetype('gitcommit', {
    --    sources = cmp.config.sources({
    --        {name = 'buffer'}
    --    })
    --}),

    -- 命令模式下输入 `/` 启用补全
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }),

    -- 命令模式下输入 `:` 启用补全
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
    }),
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
    },
  },
    -- 设置补全显示的格式
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         with_text = true,
    --         maxwidth = 50,
    --         before = function(entry, vim_item)
    --             vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
    --             return vim_item
    --         end
    --     }),
    -- },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                before = function(entry, vim_item)
                    vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                    return vim_item
                end
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
        end,
    },

-- PmenuSel = { bg = "#282C34", fg = "NONE" },
-- Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

-- CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
-- CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
-- CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
-- CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },

-- CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
-- CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
-- CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

-- CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
-- CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
-- CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

-- CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
-- CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
-- CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

-- CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
-- CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
-- CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
-- CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
-- CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

-- CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
-- CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

-- CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
-- CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
-- CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

-- CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
-- CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
-- CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

-- CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
-- CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
-- CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
})
