-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.lazyvim_rust_format = "rustfmt"
vim.g.lazyvim_rust_lsp = "rust-analyzer"
