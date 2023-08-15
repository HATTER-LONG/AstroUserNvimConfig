return {
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
}
