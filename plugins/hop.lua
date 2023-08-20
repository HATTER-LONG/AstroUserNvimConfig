return {
	"smoka7/hop.nvim",
	lazy = true,
	version = "*",
	event = { "BufReadPost" },
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
