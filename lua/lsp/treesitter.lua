require'nvim-treesitter.configs'.setup {
    context_commentstring = {
    enable = true
    },
    -- A list of parser names, or "all"
ensure_installed = {
    "toml",
    "json",
    "yaml",
    "html",
    "lua",
    "hcl",
    "javascript",
    "make",
    "vim",
    "typescript",
    "regex",
    "markdown",
    "gomod",
    "help",
    "html",
    "http",
    "markdown",
    "python",
    "kotlin",
    "go"
    },

-- 启用增量选择
incremental_selection = {
enable = true,
keymaps = {
    init_selection = '<CR>',
    node_incremental = '<CR>',
    node_decremental = '<BS>',
    scope_incremental = '<TAB>',
    }
},
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
  enable = true,
  disable = { "css", "python" },
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
      -- `false` will disable the whole extension
  enable = true,

  -- list of language that will be disabled
  disable = { },

  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
  },

  rainbow = {
  enable = true,
  -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- Do not enable for files with more than n lines, int
  -- colors = {}, -- table of hex strings
  -- termcolors = {} -- table of colour name strings
  },

  matchup = {
  enable = true,              -- mandatory, false will disable the whole extension
  disable = { "ruby" },  -- optional, list of language that will be disabled
  },
}

require("twilight").setup {
    dimming = {
        alpha = 0.40, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
    context = 15, -- amount of lines we will try to show around the current line
    treesitter = true, -- use treesitter when available for the filetype
    -- treesitter is used to automatically expand the visible text,
    -- but you can further control the types of nodes that should always be fully expanded
    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
    },
exclude = {}, -- exclude these filetypes
}


require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
        'class',
        'function',
        'method',
        'for',
        'while',
        'if',
        -- 'switch',
        -- 'case',
        },
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
    },
exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true, 
    }
}

require("twilight").enable()

