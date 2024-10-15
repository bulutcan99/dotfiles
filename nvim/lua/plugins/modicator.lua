return {
  "mawkler/modicator.nvim",
  event = "ModeChanged",
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = false,
    highlights = {
      defaults = { bold = true },
    },
  },
}
