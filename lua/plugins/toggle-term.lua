return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Open using Ctrl + ` (matches VS Code layout exactly)
      open_mapping = [[<C-t>]], 
      direction = "horizontal",    -- Split at the bottom
      size = 15,                  -- Height of the terminal split
      start_in_insert = true,     -- Start typing immediately upon opening
      insert_mappings = true,     -- Allow toggling out while in insert mode
      terminal_mappings = true,   -- Allow toggling out while inside terminal mode
      persist_size = true,        -- Remember your resized terminal window height
    })

    -- Seamless escape and navigation rules for the terminal window
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Press Esc twice to safely drop into Normal mode inside terminal output
      vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)
      -- Allow standard Ctrl + hjkl pane hopping from the terminal split
      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
    end

    -- Run these navigation helpers whenever a terminal launches
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        _G.set_terminal_keymaps()
      end,
    })
  end,
}

