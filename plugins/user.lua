return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
	{
		"smoka7/hop.nvim",
		lazy = true,
		version = "*",
		event = { "CursorHold", "CursorHoldI" },
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = { "SudaRead", "SudaWrite" },
		config = function()
			vim.g["suda#prompt"] = "Enter administrator password: "
		end,
	},
	{
		"ibhagwan/smartyank.nvim",
		lazy = true,
		event = "BufReadPost",
		config = function()
			require("smartyank").setup({
				highlight = {
					enabled = false, -- highlight yanked text
					higroup = "IncSearch", -- highlight group of yanked text
					timeout = 2000, -- timeout for clearing the highlight
				},
				clipboard = {
					enabled = true,
				},
				tmux = {
					enabled = true,
					-- remove `-w` to disable copy to host client's clipboard
					cmd = { "tmux", "set-buffer", "-w" },
				},
				osc52 = {
					enabled = true,
					escseq = "tmux", -- use tmux escape sequence, only enable if you're using remote tmux and have issues (see #4)
					ssh_only = true, -- false to OSC52 yank also in local sessions
					silent = false, -- true to disable the "n chars copied" echo
					echo_hl = "Directory", -- highlight group of the OSC52 echo message
				},
			})
		end,
	},
	{
		"brglng/vim-im-select",
		lazy = true,
		event = "BufReadPost",
		config = function()
			local global = require("user.global")
			if global.is_mac then
				vim.api.nvim_command([[let g:im_select_get_im_cmd = ["macism"] ]])
				vim.api.nvim_command([[let g:im_select_default = "com.apple.keylayout.ABC"]])
				vim.api.nvim_command([[let g:ImSelectSetImCmd = {key -> ['macism', key]}]])
				vim.api.nvim_command([[let g:im_select_enable_focus_events = 0]])
			elseif vim.fn.executable("fcitx5-remote") == 1 then
				-- fcitx5 need a manual config
				vim.api.nvim_cmd({
					[[ let g:im_select_get_im_cmd = ["fcitx5-remote"] ]],
					[[ let g:im_select_default = '1' ]],
					[[ let g:ImSelectSetImCmd = {
			\ key ->
			\ key == 1 ? ['fcitx5-remote', '-c'] :
			\ key == 2 ? ['fcitx5-remote', '-o'] :
			\ key == 0 ? ['fcitx5-remote', '-c'] :
			\ execute("throw 'invalid im key'")
			\ }
			]],
				}, { true, true, true })
			end
		end,
	},
}
