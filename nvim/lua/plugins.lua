local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({
	function(use)
		-- Mandatory --
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")

		-- Stuff --
		use({ "folke/tokyonight.nvim" })
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({ "kyazdani42/nvim-web-devicons" })
		use({
			"nvim-lualine/lualine.nvim",
			event = "BufEnter",
			config = function()
				require("plugins/lualine")
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("plugins/bufferline")
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("plugins/nvimtree")
			end,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = "BufWinEnter",
			config = function()
				require("plugins/treesitter")
			end,
		})
		use({
			"nvim-treesitter/playground",
			after = "nvim-treesitter",
		})
		use({
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		})
		use({
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
		})
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("plugins/autopairs")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins/lsp")
			end,
		})
		use({
			"williamboman/mason.nvim",
			config = function()
				require("plugins/mason")
			end,
		})
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-vsnip" })
		use({ "hrsh7th/vim-vsnip" })
		use({ "onsails/lspkind-nvim" })
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("plugins/null-ls")
			end,
		})
		use({
			"glepnir/lspsaga.nvim",
			config = function()
				require("plugins/lspsaga")
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins/indent")
			end,
		})
		use({
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				require("plugins/gitsigns")
			end,
		})
		use({
			"rhysd/git-messenger.vim",
			event = "BufRead",
			config = function()
				require("plugins/messenger")
			end,
		})
		use({
			{
				"nvim-telescope/telescope.nvim",
				config = function()
					require("plugins/telescope")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				after = "telescope.nvim",
				run = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-symbols.nvim",
				after = "telescope.nvim",
			},
		})
		use({
			"MunifTanjim/prettier.nvim",
			config = function()
				require("plugins/prettier")
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
