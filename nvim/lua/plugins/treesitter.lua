require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "tsx", "javascript", "graphql", "lua" },

	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
})
