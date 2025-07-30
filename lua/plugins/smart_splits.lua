return {
  "mrjones2014/smart-splits.nvim", -- The GitHub repository for the smart-splits.nvim plugin

  config = function()
    local smartsplits = require("smart-splits")

    smartsplits.setup({
      ignored_buftypes = {
        "nofile",   -- Buffers not associated with a file (e.g., [No Name] buffers)
        "quickfix", -- Quickfix and location list windows
        "prompt",   -- Command-line prompts (like when typing ':' commands)
      },

      ignored_filetypes = { "NvimTree" }, -- Commonly used for the NvimTree file explorer plugin

      default_amount = 5,

      move_cursor_same_row = false,

      term_split_cmd = {
        tmux = "tmux send-keys",
        zellij = "zellij action move-focus --direction",
      },
    })

    -- Keybindings for moving cursor between Neovim splits or to adjacent terminal panes.
    vim.keymap.set("n", "<C-k>", smartsplits.move_cursor_up, { desc = "Smart Splits: Move cursor up" })
    vim.keymap.set("n", "<C-l>", smartsplits.move_cursor_right, { desc = "Smart Splits: Move cursor right" })
    vim.keymap.set("n", "<C-j>", smartsplits.move_cursor_down, { desc = "Smart Splits: Move cursor down" })
    vim.keymap.set("n", "<C-h>", smartsplits.move_cursor_left, { desc = "Smart Splits: Move cursor left" })

    -- Keybindings for resizing Neovim splits or terminal panes.
    vim.keymap.set("n", "<M-k>", smartsplits.resize_up, { desc = "Smart Splits: Resize up" })
    vim.keymap.set("n", "<M-l>", smartsplits.resize_right, { desc = "Smart Splits: Resize right" })
    vim.keymap.set("n", "<M-j>", smartsplits.resize_down, { desc = "Smart Splits: Resize down" })
    vim.keymap.set("n", "<M-h>", smartsplits.resize_left, { desc = "Smart Splits: Resize left" })

    -- Keybindings for swapping buffers/windows within Neovim splits.
    -- These commands manipulate the arrangement of Neovim's own windows.
    vim.keymap.set("n", "<C-w>k", smartsplits.swap_buf_up, { desc = "Smart Splits: Swap window up" })
    vim.keymap.set("n", "<C-w>l", smartsplits.swap_buf_right, { desc = "Smart Splits: Swap window right" })
    vim.keymap.set("n", "<C-w>j", smartsplits.swap_buf_down, { desc = "Smart Splits: Swap window down" })
    vim.keymap.set("n", "<C-w>h", smartsplits.swap_buf_left, { desc = "Smart Splits: Swap window left" })
  end,
}
