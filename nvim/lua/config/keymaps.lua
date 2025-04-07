-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select All
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" }) -- Select the entire file

-- Buffer editing
keymap.set("n", "<Leader>bn", ":enew<Return>", { desc = "Create new buffer" }) -- Create a new empty buffer
keymap.set("n", "<tab>", function()
    vim.cmd("bnext")
end, { desc = "Go to next buffer" })
keymap.set("n", "<Leader>bO", function()
    vim.cmd("1,$bd!") -- Delete all buffers
end, { desc = "Save and close all buffers" })
keymap.set("n", "<S-tab>", function()
    vim.cmd("bprev")
end, { desc = "Go to previous buffer" })
