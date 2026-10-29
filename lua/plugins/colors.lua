--local function enable_transparency()
--    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--end
--return {
    --{
	--"folke/tokyonight.nvim",
	--config = function()
	    --vim.cmd.colorscheme "tokyonight"
	    --enable_transparency()
	--end
    --},
    --{
	--"nvim-lualine/lualine.nvim",
	--dependencies = {
	    --"nvim-tree/nvim-web-devicons",
	--},
	--opts = {
	    --theme = 'tokyonight',
	--}
    --},
--
--}
--


local function enable_transparency()
    -- Wipes out backgrounds for code workspace and key sidebar extensions
    local groups = {
        "Normal", "NormalNC", "SignColumn",
        "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeSignColumn", "NeoTreeEndOfBuffer",
        "WinSeparator", "NeoTreeWinSeparator", "ToggleTerm"
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
    
    -- FORCE Lualine highlight groups to keep their backgrounds solid
    local lualine_groups = {
        "StatusLine", "StatusLineNC", 
        "LuaLineDiffAdd", "LuaLineDiffChange", "LuaLineDiffDelete"
    }
    for _, group in ipairs(lualine_groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.bg then
            -- Re-link it to make sure it doesn't accidentally inherit 'none'
            vim.api.nvim_set_hl(0, group, { bg = hl.bg, fg = hl.fg })
        end
    end
end

return {
    -- 1. Install and activate Cyberdream
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true, -- Leaves code background clear
                italic_comments = true,
            })
            vim.cmd.colorscheme "cyberdream"
            enable_transparency()
        end
    },

    -- 2. Setup your status line to match Cyberdream
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = 'cyberdream', 
                icons_enabled = true,
            }
        }
    },
}

