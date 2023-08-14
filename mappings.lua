-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		["<leader>h"] = false,
		-- navigate buffer tabs with `H` and `L`
		-- L = {
		--   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
		--   desc = "Next buffer",
		-- },
		-- H = {
		--   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
		--   desc = "Previous buffer",
		-- },

		-- Base
		L = { "$", desc = "Jump end of line" },
		H = { "^", desc = "Jump end of line" },

		["<leader>bn"] = { "<cmd>Neotree buffers toggle<cr>", desc = "Toggle buffers" },

		-- Hop
		["<leader>w"] = { "<Cmd>HopWordMW<CR>", desc = "jump: Goto word" },
		["<leader>j"] = { "<Cmd>HopLineMW<CR>", desc = "jump: Goto line" },
		["<leader>k"] = { "<Cmd>HopLineMW<CR>", desc = "jump: Goto line" },
		["<leader>c"] = { "<Cmd>HopChar1MW<CR>", desc = "jump: Goto one char" },
		["<leader>cc"] = { "<Cmd>HopChar2MW<CR>", desc = "jump: Goto two chars" },

		-- suda
		["<C-x>s"] = { "<Cmd>SudaWrite<CR>", desc = "Suda write" },
	},
	i = {
		["<C-s>"] = { "<ESC><Cmd>w<CR>", desc = "save" },
		["<C-j>"] = { "<Right>", desc = "right" },
		["<C-k>"] = { "<Left>", desc = "left" },
	},
	v = {
		-- Base
		L = { "$", desc = "Jump end of line" },
		H = { "^", desc = "Jump end of line" },
		[">"] = { ">gv", desc = "Increase indent" },
		["<"] = { "<gv", desc = "Increase indent" },
		["p"] = { "pgvy", desc = "Better past" },

		-- Hop
		["<leader>w"] = { "<Cmd>HopWord<CR>", desc = "jump: Goto word v" },
		["<leader>j"] = { "<Cmd>HopLine<CR>", desc = "jump: Goto line v" },
		["<leader>k"] = { "<Cmd>HopLine<CR>", desc = "jump: Goto line v" },
		["<leader>c"] = { "<Cmd>HopChar1<CR>", desc = "jump: Goto one char v" },
		["<leader>cc"] = { "<Cmd>HopChar2<CR>", desc = "jump: Goto two chars v" },
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},
}
