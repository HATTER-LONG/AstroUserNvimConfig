return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.completion.copilot-lua-cmp" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{
		"noice.nvim",
		opts = {
			-- lsp = {
			-- 	progress = {
			-- 		enabled = true,
			-- 	},
			-- },
			presets = {
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	{ import = "astrocommunity.split-and-window.edgy-nvim" },
	{
		"edgy.nvim",
		opts = {
			animate = {
				enabled = false,
			},
		},
	},
}
