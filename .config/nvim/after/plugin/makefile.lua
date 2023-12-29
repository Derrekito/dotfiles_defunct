vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
      vim.opt_local.tabstop = 8
      vim.opt_local.shiftwidth = 8
      vim.opt_local.expandtab = false
  end,
})
