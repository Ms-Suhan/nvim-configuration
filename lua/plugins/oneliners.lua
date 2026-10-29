return {
  --  { -- This hepls with ssh tunneling and copying to clipboard
--	'ojraoques/vim-oscyank',
  --  },
    --{ --Git plugin
--	'tpope/vim-fugitive',
  --  },
--    { Show CSS Colors
--	'brenoprata10/nvim-highlight-colors',
--	config = function()
--	    require('nvim-highlight-colors').setup({})
--	end
  --  },
  --

  "brenoprata10/nvim-highlight-colors",
  config = function()
      require("nvim-highlight-colors").setup({
	  --@usage 'background' / 'foreground' / ' virtual'
	  render = 'background',

	  -- Set virtual symbol character if render mode is set to 'virtual'
	  virtual_symbol = '■',

	  -- Enable_tailwind Css Support
	  enable_tailwind = true,

	  -- Exclude specific filetypes from highlight
	  exclude_filetypes = { "lazy", "mason"},
      })
  end

}


