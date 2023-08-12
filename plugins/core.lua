return {
	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				[[████████╗██╗  ██╗██╗███████╗    ██╗███████╗    ███████╗██╗███╗   ██╗███████╗]],
				[[╚══██╔══╝██║  ██║██║██╔════╝    ██║██╔════╝    ██╔════╝██║████╗  ██║██╔════╝]],
				[[   ██║   ███████║██║███████╗    ██║███████╗    █████╗  ██║██╔██╗ ██║█████╗  ]],
				[[   ██║   ██╔══██║██║╚════██║    ██║╚════██║    ██╔══╝  ██║██║╚██╗██║██╔══╝  ]],
				[[   ██║   ██║  ██║██║███████║    ██║███████║    ██║     ██║██║ ╚████║███████╗]],
				[[   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝    ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝]],
			}

			return opts
		end,
		config = function(_, opts)
			local alpha = require("alpha")
			require("alpha.term")
			local dashboard = opts

			local function footer()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return "   Have Fun with neovim"
					.. "  󰀨 v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
					.. "  󰂖 "
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
			end

			local width = 46
			local height = 25 -- two pixels per vertical space
			dashboard.section.terminal.command = "cat | " .. vim.fn.stdpath("config") .. "/lua/user/thisisfine.sh"
			dashboard.section.terminal.width = width
			dashboard.section.terminal.height = height
			dashboard.section.terminal.opts.redraw = true

			dashboard.config.layout = {
				{ type = "padding", val = 1 },
				dashboard.section.terminal,
				{ type = "padding", val = 5 },
				dashboard.section.header,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = 1 },
				dashboard.section.footer,
			}

			alpha.setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					dashboard.section.footer.val = footer()
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	{
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			local status = require("astronvim.utils.status")

			opts.statusline = { -- statusline
				hl = { fg = "fg", bg = "bg" },
				status.component.mode({ mode_text = { padding = { left = 1, right = 1 } } }), -- add the mode text
				status.component.git_branch(),
				status.component.file_info({ filetype = {}, filename = false, file_modified = false }),
				status.component.git_diff(),
				status.component.diagnostics(),
				status.component.fill(),
				status.component.cmd_info(),
				status.component.fill(),
				-- status.component.lsp(),
				status.component.treesitter(),
				status.component.nav(),
				-- remove the 2nd mode indicator on the right
			}

			return opts
		end,
	},
	-- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },
	--
	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	-- {
	--   "L3MON4D3/LuaSnip",
	--   config = function(plugin, opts)
	--     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom luasnip configuration such as filetype extend or custom snippets
	--     local luasnip = require "luasnip"
	--     luasnip.filetype_extend("javascript", { "javascriptreact" })
	--   end,
	-- },
	-- {
	--   "windwp/nvim-autopairs",
	--   config = function(plugin, opts)
	--     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom autopairs configuration such as custom rules
	--     local npairs = require "nvim-autopairs"
	--     local Rule = require "nvim-autopairs.rule"
	--     local cond = require "nvim-autopairs.conds"
	--     npairs.add_rules(
	--       {
	--         Rule("$", "$", { "tex", "latex" })
	--           -- don't add a pair if the next character is %
	--           :with_pair(cond.not_after_regex "%%")
	--           -- don't add a pair if  the previous character is xxx
	--           :with_pair(
	--             cond.not_before_regex("xxx", 3)
	--           )
	--           -- don't move right when repeat character
	--           :with_move(cond.none())
	--           -- don't delete if the next character is xx
	--           :with_del(cond.not_after_regex "xx")
	--           -- disable adding a newline when you press <cr>
	--           :with_cr(cond.none()),
	--       },
	--       -- disable for .vim files, but it work for another filetypes
	--       Rule("a", "a", "-vim")
	--     )
	--   end,
	-- },
	-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
	-- {
	--   "folke/which-key.nvim",
	--   config = function(plugin, opts)
	--     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- Add bindings which show up as group name
	--     local wk = require "which-key"
	--     wk.register({
	--       b = { name = "Buffer" },
	--     }, { mode = "n", prefix = "<leader>" })
	--   end,
	-- },
}
