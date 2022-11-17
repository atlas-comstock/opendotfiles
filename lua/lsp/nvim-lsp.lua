util = require('lspconfig/util')
require'navigator'.setup({
  icons = {
    code_action_icon = "🏏",
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_err = '💢',
    diagnostic_warn = '🐼',
    diagnostic_info = [[👩]],
    diagnostic_hint = [[💁]],

    diagnostic_head_severity_1 = '🈲',
    diagnostic_head_severity_2 = '☣️',
    diagnostic_head_severity_3 = '👎',
    diagnostic_head_description = '👹',
    diagnostic_virtual_text =  '🦊',
    diagnostic_file = '🚑',
    value_changed = '📝',
    value_definition = '🐶🍡', -- it is easier to see than 🦕
  },
  keymaps = {
      { key = 'gK', func = vim.lsp.declaration, desc = 'declaration'},
      { key = '<C-n>', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
      { key = '<C-p>', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },
  },
 lsp = {
    gopls = {   -- gopls setting
      format_options = {async=true},
      root_dir = function(fname)
          return util.root_pattern("docklet", ".gitignore", "go.mod", ".vim/", ".git/")(fname)
          end,
      cmd = {"gopls", "-v", "-rpc.trace", "serve", "--debug=localhost:6060"},
      flags = {
          debounce_text_changes = 150,
      },
      settings = {
        gopls = {
            matcher= "fuzzy",
            -- experimentalWatchedFileDelay = "800ms",
            directoryFilters = {
                "-vendor",
                "-/usr/local/Cellar/",
                "-go",
            },
            expandWorkspaceToModule = false,
            -- memoryMode = "DegradeClosed",
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            semanticTokens= true,
            deepCompletion= true,
            semanticTokens = false,
        },
      },
      on_attach = on_attach,
    },
 }
})


lspProgressBar = require"fidget".setup{}
