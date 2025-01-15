if (vim.loop.os_uname().sysname == "Windows_NT") then
    -- https://www.sqlite.org/2024/sqlite-dll-win-x64-3470200.zip
    vim.g.sqlite_clib_path = "C:/Users/TDU1/Documents/fd-v10.2.0-x86_64-pc-windows-msvc/sqlite3.dll"
end

return {
    -- Font with icons
    {
        "nvim-tree/nvim-web-devicons", opts = {}
    },
    {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
            require('mini.icons').setup()
        end,
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = true,
            },
            "HiPhish/rainbow-delimiters.nvim",
            "nvim-treesitter/nvim-treesitter-refactor",
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
        event = "BufReadPost",
        config = function()
            require("plugins.configs.nvim-treesitter")
        end,
    },
    -- Misc
    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = false,
        },
        keys = require("core.mappings").comment_nvim
    },
    {
        "chrisgrieser/nvim-spider",
        lazy = true,
        keys = require("core.mappings").nvim_spider
    },
    -- File Search
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "princejoogie/dir-telescope.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "danielfalk/smart-open.nvim", dependencies = { "kkharji/sqlite.lua" } }
        },
        keys = require("core.mappings").telescope,
        cmd = { "Telescope" },
        config = function()
            require("plugins.configs.telescope_nvim")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        -- cmd = "Neotree",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        keys = require("core.mappings").neo_tree,
        config = function()
            require("plugins.configs.neo-tree")
        end
    },
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.configs.gitsigns")
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewFileHistory",
        },
        keys = require("core.mappings").diffview,
        config = true
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            "nvim-telescope/telescope.nvim",
        },
        keys = require("core.mappings").neogit,
        config = true
    },
    -- Docs
    {
        "folke/which-key.nvim",
        keys = require("core.mappings").which_key,
        config = function()
            require("plugins.configs.whichkey")
        end,
    },
}
