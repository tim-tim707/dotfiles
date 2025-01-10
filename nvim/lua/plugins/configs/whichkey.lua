-- https://github.com/kristijanhusak/vim-dadbod-ui
local wk = require("which-key")

local options = {
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "  ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},

	disable = {
		filetypes = { "TelescopePrompt" },
	},

	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},

	win = {
		border = "none", -- none/single/double/shadow
	},

	layout = {
		spacing = 6, -- spacing between columns
	},
}

wk.setup(options)
