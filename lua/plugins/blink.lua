
return {
  {
    "saghen/blink.cmp",
    lazy = false,
    priority = 100,
    version = "1.*",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      fuzzy = {
        implementation = "lua",
      },

      keymap = {
        preset = "default",

        ["<C-space>"] = {
          "show",
          "show_documentation",
          "hide_documentation",
        },

        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          auto_show = true,
	    },
	 accept = {
	     auto_brackets = {
	     enabled = true,
      },
    },

      },


      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
    },
  },
}

