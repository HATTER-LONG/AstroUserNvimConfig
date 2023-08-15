return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "andersevenrud/cmp-tmux" },
		{ "f3fora/cmp-spell" },
		{ "kdheepak/cmp-latex-symbols" },
	},
	opts = function(_, opts)
		local icons = {
			kind = require("user.icons").get("kind"),
			type = require("user.icons").get("type"),
			cmp = require("user.icons").get("cmp"),
		}

		local compare = require("cmp.config.compare")

		compare.lsp_scores = function(entry1, entry2)
			local diff
			if entry1.completion_item.score and entry2.completion_item.score then
				diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
			else
				diff = entry2.score - entry1.score
			end
			return (diff < 0)
		end
		local comparators = {
			-- require("cmp_tabnine.compare"),
			compare.offset, -- Items closer to cursor will have lower priority
			compare.exact,
			-- compare.scopes,
			compare.lsp_scores,
			compare.sort_text,
			compare.score,
			compare.recently_used,
			-- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}
		local myopts = {
			sorting = {
				priority_weight = 2,
				comparators = comparators,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
					-- load lspkind icons
					vim_item.kind = string.format(
						" %s  %s",
						lspkind_icons[vim_item.kind] or icons.cmp.undefined,
						vim_item.kind or ""
					)

					vim_item.menu = setmetatable({
						cmp_tabnine = "[TN]",
						copilot = "[CPLT]",
						buffer = "[BUF]",
						orgmode = "[ORG]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[LUA]",
						path = "[PATH]",
						tmux = "[TMUX]",
						treesitter = "[TS]",
						latex_symbols = "[LTEX]",
						luasnip = "[SNIP]",
						spell = "[SPELL]",
					}, {
						__index = function()
							return "[BTN]" -- builtin/unknown source names
						end,
					})[entry.source.name]

					local label = vim_item.abbr
					local truncated_label = vim.fn.strcharpart(label, 0, 80)
					if truncated_label ~= label then
						vim_item.abbr = truncated_label .. "..."
					end

					return vim_item
				end,
			},

			-- You should specify your *installed* sources.
			sources = {
				{ name = "nvim_lsp", max_item_count = 350 },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "treesitter" },
				{ name = "spell" },
				{ name = "tmux" },
				{ name = "orgmode" },
				{ name = "buffer" },
				{ name = "latex_symbols" },
			},
			experimental = {
				ghost_text = {
					hl_group = "Whitespace",
				},
			},
		}

		return require("astronvim.utils").extend_tbl(opts, myopts)
	end,
}
