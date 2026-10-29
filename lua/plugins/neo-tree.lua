return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree", -- Ensures the command lazy-loads the plugin
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Required for file icons
    "MunifTanjim/nui.nvim",        -- Required UI component library
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-Tree" },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true, -- Automatically focuses the current file in the tree
      },
      use_libuv_file_watcher = true, -- Auto-refreshes tree when files change externally
    },
  },
}

