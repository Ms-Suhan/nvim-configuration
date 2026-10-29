--return {
  --{
    --"mason-org/mason.nvim",
    --opts = {},
  --},
--
  --{
    --"neovim/nvim-lspconfig",
  --},
--
  --{
    --"mason-org/mason-lspconfig.nvim",
    --dependencies = {
      --"mason-org/mason.nvim",
      --"neovim/nvim-lspconfig",
      --"saghen/blink.cmp",
    --},
--
    --config = function()
      ---- 1. Grab Blink's capabilities
      --local capabilities = require("blink.cmp").get_lsp_capabilities()
--
      --require("mason-lspconfig").setup({
        --ensure_installed = {
          --"lua_ls",
          --"pyright",
          --"ts_ls",
          --"html",
          --"cssls",
        --},
        ---- 2. Setup handlers to automatically configure and start your servers
        --handlers = {
          ---- Default handler for all servers
          --function(server_name)
            --require("lspconfig")[server_name].setup({
              --capabilities = capabilities,
            --})
          --end,
--
          ---- Targeted override for Pyright to make FastAPI & Pydantic work perfectly
          --["pyright"] = function()
            --require("lspconfig").pyright.setup({
              --capabilities = capabilities,
              --settings = {
                --python = {
                  --analysis = {
                    ---- Forces Pyright to look inside your virtual environment libraries
                    --useLibraryCodeForTypes = true,
                    --autoImportCompletions = true,
                  --},
                --},
              --},
            --})
          --end,
        --},
      --})
--
      ---- Set keymaps only when an LSP attaches to a buffer.
      --vim.api.nvim_create_autocmd("LspAttach", {
        --callback = function(event)
          --local opts = { buffer = event.buf, silent = true }
--
          --vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          --vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          --vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          --vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          --vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          --vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          --vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        --end,
      --})
    --end,
  --},
--}
--
--

return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
  },

  -- 1. Explicitly add and configure blink.cmp here
  {
    "saghen/blink.cmp",
    lazy = false, -- Or build your lazy loading strategy around it
    version = "*", -- Highly recommended by the author for stable releases
    opts = {
      -- You can configure keymaps or sources here if needed
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp", -- Keeps the load order correct
    },

    config = function()
      -- 2. Blink's capabilities will now resolve properly because the plugin is active
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["pyright"] = function()
            require("lspconfig").pyright.setup({
              capabilities = capabilities,
              settings = {
                python = {
                  analysis = {
                    useLibraryCodeForTypes = true,
                    autoImportCompletions = true,
                  },
                },
              },
            })
          end,
        },
      })

      -- LSP Attach Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },
}

