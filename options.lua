local global = require("user.global")
return function(local_vim)
	local_vim.opt.relativenumber = true
	local_vim.g.mapleader = " "
	local_vim.opt.whichwrap = vim.opt.whichwrap - { "b", "s" } -- removing option from list
	local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list

	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	elseif global.is_wsl then
		vim.g.clipboard = {
			name = "win32yank-wsl",
			copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
			},
			paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
			},
			cache_enabled = 0,
		}
	end
	return local_vim
end
