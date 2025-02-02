local opt = vim.opt
local g = vim.g

-- Set leader key
g.mapleader = " "
g.maplocalleader = " "

-- global statusline
opt.laststatus = 3
opt.showmode = false

if (vim.loop.os_uname().sysname == "Windows_NT") then
    -- clipboard.vim takes a long time issues/9570
    -- Saves ~4 seconds on big directory
    g.clipboard = {
        name = 'win32yank',
        copy = {
            ["+"] = 'win32yank.exe -i --crlf',
            ["*"] = 'win32yank.exe -i --crlf',
        },
        paste = {
            ["+"] = 'win32yank.exe -o --lf',
            ["*"] = 'win32yank.exe -o --lf',
        },
        cache_enabled = 0,
    }
end
-- Disable netrw loading, use neotree instead
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

opt.clipboard = "unnamedplus" -- allow nvim to access system clipboard
opt.cursorline = true
opt.cursorlineopt = "number"

opt.list = true
opt.listchars:append {
    tab = ">-",
    trail = ".",
    nbsp = "¬",
}

opt.backspace = { "eol", "indent", "start" }

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = -1

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.ruler = false

-- ui
opt.pumheight = 10
opt.scrolloff = 5
opt.sidescrolloff = 8
opt.showtabline = 2
-- Preview substitutions live, as you type 
opt.inccommand = "split"
-- opt.colorcolumn = "79"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
-- opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 250

-- Enable integrated undo.
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- I don't need swap file and backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- disable nvim intro
opt.shortmess:append "sI"

