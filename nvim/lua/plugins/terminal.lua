return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        local Terminal = require("toggleterm.terminal").Terminal

        toggleterm.setup({
            size = 10,
            open_mapping = [[<C-p>]],
            shading_factor = 2,
            direction = "float",
            float_opts = {
                border = "curved",
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        -- CTRL+P ile toggle yapıyoruz
        vim.keymap.set("n", "<C-p>", function()
            toggleterm.toggle(1) -- 1 numaralı terminali aç/kapat
        end, { noremap = true, silent = true })

        -- Akıllı terminal kapatma fonksiyonu
        local function smart_kill_terminal()
            local buftype = vim.bo.buftype
            if buftype == "terminal" then
                -- Eğer şu an terminal buffer'ındaysan sadece onu kapat
                vim.cmd("bdelete!")
            else
                -- Eğer terminalde değilsen tüm açık terminalleri kapat
                local terms = require("toggleterm.terminal").get_all()
                for _, term in ipairs(terms) do
                    if term:is_open() then
                        term:close()
                    end
                end
            end
        end

        -- CTRL+A ile çalıştırıyoruz
        vim.keymap.set(
            "n",
            "<C-a>",
            smart_kill_terminal,
            { noremap = true, silent = true }
        )
    end,
}
