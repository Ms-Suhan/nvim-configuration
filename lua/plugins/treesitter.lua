return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local treesitter = require("nvim-treesitter")

    -- Initialize treesitter
    treesitter.setup({})

    -- Install your preferred language parsers
    treesitter.install({ 
      "c", 
      "lua", 
      "vim", 
      "vimdoc", 
      "query", 
      "javascript", 
      "python" 
    })

    -- Automatically start native tree-sitter highlighting when opening these files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "lua", "vim", "javascript", "python" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}

