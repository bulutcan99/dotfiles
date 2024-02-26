-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('i', '<BS>', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BS>', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })



