require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Go to lsp definition
map("n", "<leader>gd", ":Telescope lsp_definitions<CR>", { desc = "Go to definition", silent = true })

-- Go to references
map("n", "<leader>gr", ":Telescope lsp_references<CR>", { desc = "Go to references", silent = true })
