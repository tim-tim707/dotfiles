-- https://github.com/lewis6991/gitsigns.nvim
local gitsigns = require("gitsigns")
local map = require("internal.utils").map

local function on_attach(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    map("n", "<leader>gj", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true,  desc = "next hunk" })

    map("n", "<leader>gk", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "prev hunk" })

    -- Actions
    map("n", "<leader>ga", gs.stage_hunk, { desc = "stage hunk" })
    map("v", "<leader>ga", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "stage hunk" })

    map("n", "<leader>gu", gs.reset_hunk, { desc = "reset hunk" })
    map("v", "<leader>gu", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "reset hunk" })

    map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
end

local config = {
    on_attach = on_attach,
}

gitsigns.setup(config)
