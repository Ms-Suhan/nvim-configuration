vim.g.mapleader=" "
vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>c", ":Neotree close<CR>", { desc = "Close Neo-tree" })


-- Insert mode: Delete word backwards
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete word backwards" })
vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Delete word backwards" })

-- Command-line mode: Delete word backwards
vim.keymap.set("c", "<C-H>", "<C-W>", { desc = "Delete word backwards" })
vim.keymap.set("c", "<C-BS>", "<C-W>", { desc = "Delete word backwards" })


