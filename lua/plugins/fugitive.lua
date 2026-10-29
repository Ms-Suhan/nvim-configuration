return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- Map <leader>gs to open the interactive Git status dashboard
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
}

