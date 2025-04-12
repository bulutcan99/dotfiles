-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Buffer editing
keymap.set("n", "<tab>", function()
    vim.cmd("bnext")
end, { desc = "Go to next buffer" })
keymap.set("n", "<S-tab>", function()
    vim.cmd("bprev")
end, { desc = "Go to previous buffer" })

-- Markers
vim.keymap.set("n", "dar", function()
    vim.cmd("delm! | delm A-Z0-9")
end, { desc = "Delete all a-z / A-Z marks" })
