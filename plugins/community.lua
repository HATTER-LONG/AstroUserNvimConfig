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
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{
		"rainbow-delimiters.nvim",
		config = function()
			local function init_strategy()
				return function()
					local errors = 200
					vim.treesitter.get_parser():for_each_tree(function(lt)
						if lt:root():has_error() and errors >= 0 then
							errors = errors - 1
						end
					end)
					if errors < 0 then
						return nil
					end
					return require("rainbow-delimiters").strategy["global"]
				end
			end

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = init_strategy(),
				},
				query = {
					[""] = "rainbow-delimiters",
					latex = "rainbow-blocks",
					javascript = "rainbow-delimiters-react",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterOrange",
					"RainbowDelimiterYellow",
					"RainbowDelimiterGreen",
					"RainbowDelimiterBlue",
					"RainbowDelimiterCyan",
					"RainbowDelimiterViolet",
				},
			}
		end,
	},
}
