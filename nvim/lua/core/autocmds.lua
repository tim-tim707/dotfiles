local autocmd = vim.api.nvim_create_autocmd
local general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general_settings,
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
  desc = "Check if we need to reload the file when it changed"
})

autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general_settings,
  desc = "Don't auto commenting new lines",
})
