return {
	"smoka7/hop.nvim",
	lazy = true,
	version = "*",
	event = { "CursorHold", "CursorHoldI" },
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
