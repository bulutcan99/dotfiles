return {
    {
        "rhysd/vim-grammarous",
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>gn",
                "<Plug>(grammarous-check)",
                { silent = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>gN",
                "<Plug>(grammarous-move-to-next-error)",
                { silent = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>gp",
                "<Plug>(grammarous-move-to-previous-error)",
                { silent = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>gx",
                "<Plug>(grammarous-reset)",
                { silent = true }
            )
        end,
    },
}
