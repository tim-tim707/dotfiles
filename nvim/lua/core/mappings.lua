local map = require("internal.utils").map

-- Easier split navigation, CTRL + hjlk
map("n", "<C-j>", "<C-W><C-j>", { desc = "window down" })
map("n", "<c-k>", "<c-w><C-k>", { desc = "window up" })
map("n", "<C-l>", "<c-w><C-l>", { desc = "window left" })
map("n", "<C-h>", "<C-W><C-h>", { desc = "window right" })

-- Resize windows
map("n", "<UP>", "<Cmd>resize +2<CR>")
map("n", "<Down>", "<Cmd>resize -2<CR>")
map("n", "<Left>", "<Cmd>vertical resize +2<CR>")
map("n", "<Right>", "<Cmd>vertical resize -2<CR>")

-- Make an easier redo mapping
map("n", "U", "<C-R>")

-- Easier file save and exit
map("n", "<Leader>w", "<Cmd>update<CR>", { desc = "save file" })
map("n", "<Leader>W", "<Cmd>x<CR>", { desc = "save file and exit" })
map("n", "<Leader>q", "<Cmd>q<CR>", { desc = "exit" })

-- Use simple ; instead of shift + :
map({ "n", "v" }, ";", ":", { silent = false })

-- Move selected lines up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Better tabbing
map("n", ">", ">>")
map("n", "<", "<<")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Tabs control
map("n", "<Leader>tl", "<Cmd>tabnext<CR>", { desc = "tab right" })
map("n", "<Leader>th", "<Cmd>tabprev<CR>", { desc = "tab left" })
map("n", "<Leader>1", "1gt", { desc = "tab 1" })
map("n", "<Leader>2", "2gt", { desc = "tab 2" })
map("n", "<Leader>3", "3gt", { desc = "tab 3" })
map("n", "<Leader>4", "4gt", { desc = "tab 4" })
map("n", "<Leader>5", "5gt", { desc = "tab 5" })
map("n", "<Leader>6", "6gt", { desc = "tab 6" })
map("n", "<Leader>7", "7gt", { desc = "tab 7" })
map("n", "<Leader>8", "8gt", { desc = "tab 8" })
map("n", "<Leader>9", "9gt", { desc = "tab 9" })

-- Indent empty line
map("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true, desc = "properly indent on empty line when insert" })

--
-- PLUGINS MAPPINGS
--

local plugins_mappings = {
        -- chrisgrieser/nvim-spider
	nvim_spider = {
		{
			"w",
			"<Cmd>lua require('spider').motion('w')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-w",
		},
		{
			"e",
			"<Cmd>lua require('spider').motion('e')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-e",
		},
		{
			"b",
			"<Cmd>lua require('spider').motion('b')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-b",
		},
	},
        -- numToStr/Comment.nvim
	comment_nvim = {
		{
			"<Leader>/",
			function ()require("Comment.api").toggle.linewise.current() end,
			mode = "n",
			desc = "Toggle comment"
		},
		{
			"<Leader>/",
			"<ESC><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			mode = "v",
			desc = "Toggle comment",
		}
	},
	-- nvim-telescope/telescope.nvim
	telescope = {
		{
			"<Leader>ff",
			function () require("telescope.builtin").find_files() end,
			-- function () require("telescope").extensions.smart_open.smart_open() end,
			desc = "Find files"
		},
		{
			"<Leader>fd",
			function () require("telescope").extensions.dir.find_files() end,
			desc = "Find files in directory"
		},
		{
			"<Leader>fo",
			function () require("telescope.builtin").oldfiles() end,
			desc = "Find oldfiles"
		},
		{
			"<Leader>fW",
			function () require("telescope.builtin").live_grep() end,
			desc = "Live grep"
		},
		{
			"<Leader>fc",
			function () require("telescope.builtin").grep_string() end,
			desc = "Find for word under cursor"
		},
		{
			"<Leader>fm",
			function () require("telescope.builtin").man_pages() end,
			desc = "Find man"
		},
		{
			"<Leader>fh",
			function ()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find neovim help"
		},
	},
        -- nvim-neo-tree/neo-tree.nvim
	neo_tree = {
		{ "<C-e>", "<Cmd>Neotree toggle<CR>", desc = "Toggle NvimTree" },
		{ "<Leader>hf", "<Cmd>Neotree reveal<CR>", desc = "Find file inside tree" },
	},
}

return plugins_mappings
