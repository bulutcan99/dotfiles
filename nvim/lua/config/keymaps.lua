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

-- Terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Don't yank on delete/change operations
keymap.set({ "n", "v" }, "d", [["_d]], opts)
keymap.set({ "n", "v" }, "D", [["_D]], opts)
keymap.set({ "n", "v" }, "c", [["_c]], opts)
keymap.set({ "n", "v" }, "C", [["_C]], opts)
keymap.set({ "n", "v" }, "x", [["_x]], opts)
keymap.set({ "n", "v" }, "X", [["_X]], opts)
