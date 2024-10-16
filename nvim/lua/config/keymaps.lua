-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement numbers
keymap.set("n", "<Leader>+", "<C-a>", { desc = "Increment number" }) -- Increment the number under the cursor
keymap.set("n", "<Leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement the number under the cursor

-- Select All
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" }) -- Select the entire file

-- Buffer editing
keymap.set("n", "<Leader>bn", ":enew<Return>", { desc = "Create new buffer" }) -- Create a new empty buffer
keymap.set("n", "<tab>", function()
  vim.cmd("bnext")
end, { desc = "Go to next buffer" })

-- Switch to the previous buffer
keymap.set("n", "<S-tab>", function()
  vim.cmd("bprev")
end, { desc = "Go to previous buffer" })

-- Window editing
keymap.set("n", "<Leader>tc", "<C-w>c", { desc = "Close current window" }) -- Close the current window
keymap.set("n", "<Leader>tl", "<C-w>w", { desc = "Switch to next window" }) -- Switch to the next window

-- Split Windows
keymap.set("n", "<Leader>tv", ":vsplit<Return>", { desc = "Vertical split window" }) -- Split window vertically
keymap.set("n", "<Leader>ths", ":split<Return>", { desc = "Horizontal split window" }) -- Split window horizontally

-- UI toggles
