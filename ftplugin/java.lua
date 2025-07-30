vim.opt_local.tabstop = 2         -- Number of spaces a <Tab> counts for
vim.opt_local.shiftwidth = 2      -- Number of spaces to use for each step of (auto)indent
vim.opt_local.softtabstop = 2     -- Number of spaces a <Tab> inserts (when expandtab is on)
vim.opt_local.expandtab = true    -- Use spaces instead of tabs
vim.opt_local.autoindent = true   -- Copy indent from current line when starting a new line
vim.opt_local.smartindent = true  -- Smarter autoindenting for C-like languages

-- Set the right margin (textwidth) for Java files
-- <option name="RIGHT_MARGIN" value="120" />
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "121" -- Highlight column after textwidth for visual guide

-- Set options for blank lines and control statements based on XML
-- <option name="KEEP_BLANK_LINES_IN_CODE" value="1" />
vim.opt_local.formatexpr = "v:lua.vim.lsp.buf.format({ async = true })" -- Use LSP for 'gq' formatting

-- Define buffer-local keymaps for common LSP actions.
-- These keymaps will only be active when you are in a Java file.

vim.keymap.set('n', '<leader>F', function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.name == 'jdtls' then
      vim.lsp.buf.format({ async = true })
      return
    end
  end
  vim.notify("No JDTLS client attached to format this buffer.", vim.log.levels.INFO, { title = "Java Formatting" })
end, { buffer = true, desc = "LSP: Format Java Buffer (Google Style)" })
