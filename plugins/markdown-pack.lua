return {
	{ import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
	{
		"antonk52/markdowny.nvim",
		lazy = true,
		ft = "markdown,txt",
		opts = {},
	},
	{
		"postfen/clipboard-image.nvim",
		lazy = true,
		ft = "markdown,txt",
		opts = {
			markdown = {
				img_dir = { "PIC" }, -- Use table for nested dir (New feature form PR #20)
				img_dir_txt = "./PIC",
				-- img_handler = function(img) -- New feature from PR #22
				-- 	local script = string.format('./image_compressor.sh "%s"', img.path)
				-- 	os.execute(script)
				-- end,
			},
		},
	},
	{
		"richardbizik/nvim-toc",
		lazy = true,
		ft = "markdown,txt",
		opts = {},
	},
}
