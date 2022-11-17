require('lint').linters_by_ft = {
    markdown = {'vale',},
    go = {'golangcilint'},
    py = {'pylint'},
    sh = {'shellcheck'},
    yaml = {'yamllint'},
    json = {'jsonlint'},
    js = {'jshint'},
    -- lua = {'luacheck'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
