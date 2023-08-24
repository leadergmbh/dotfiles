local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "phaazon/hop.nvim" }, --	{
	--		"nvim-neo-tree/neo-tree.nvim",
	--		branch = "v2.x",
	--		dependencies = {
	--			"nvim-lua/plenary.nvim",
	--			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--			"MunifTanjim/nui.nvim",
	--			"s1n7ax/nvim-window-picker",
	--		},
	--	},
	{ "nvim-treesitter/nvim-treesitter" },
	{ "neovim/nvim-lspconfig" },
	{ "joshdick/onedark.vim" }, -- { "cooperuser/glowbeam.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/vim-vsnip-integ" },
	-- Show hover windows with functions possible args (i:number)
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
	},
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	-- show registers in real time
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
		config = function()
			require("registers").setup()
		end,
	},
	{
		"Exafunction/codeium.vim",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	{
		-- for starting quick test right in vim
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo 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",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
})
