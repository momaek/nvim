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
	        	ensure_installed = {'go', 'vue', 'javascript', 'lua', 'typescript', 'gomod', 'gosum'},
	        	highlight = {enable = true},
	    	}
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = {  -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugin.go")
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
		'nvim-telescope/telescope.nvim', 
		version = '0.1.4', 
		event = 'BufReadPost', 
		keys = {
	    	'<leader>s', '<C-p>',
		}, 
		cmd = {
	    	'Glg', 'Gst', 'Diag', 'Tags'
		}, 
		dependencies = {
	    	{'nvim-lua/plenary.nvim'},
	    	{'BurntSushi/ripgrep'},
		}, 
		config = function()
	    	require('plugin.telescope')
		end
	}
}