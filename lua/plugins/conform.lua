return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end,
      mode = { 'n', 'v' },
      desc = 'Format file or range (conform)',
    },
  },

  config = function()
    local conform = require 'conform'
    conform.setup {
      notify_on_error = false,
      format_on_save = function()
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        rust = { 'rustfmt' },
        lua = { 'stylua' },
        bash = { 'shfmt' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        markdown = { 'prettier' },
      },
      formatters = {
        prettier = {
          command = 'prettierd',
          cwd = require('conform.util').root_file {
            '.prettierrc',
            '.prettierrc.json',
            '.prettierrc.yml',
            '.prettierrc.yaml',
            '.prettierrc.json5',
            '.prettierrc.js',
            'prettier.config.js',
            '.editorconfig',
          },
          require_cwd = true,
        },
      },
    }
  end,
}
