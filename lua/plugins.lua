return {
	{
		'momaek/vim-solarized8', 
		config = function()
	    	vim.cmd.colorscheme('solarized8_flat')
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
		  "nvim-tree/nvim-web-devicons",
		},
		config = function()
		  require("nvim-tree").setup {}
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter', 
		event = 'BufReadPost', 
		build = function()
	    	local ts_update = require('nvim-treesitter.install').update({with_sync = true})
	    	ts_update()
		end, 
		config = function()
	    	require('nvim-treesitter.configs').setup{
	        	ensure_installed = {'go', 'vue', 'javascript', 'lua', 'typescript'},
	        	highlight = {enable = true},
	    	}
		end,
	}
}