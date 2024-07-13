return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gC",  mode = { "n", "o" }, desc = "Comment toggle linewise (alternative)" }, -- alternatif kısayol
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gB",  mode = { "n", "o" }, desc = "Comment toggle blockwise (alternative)" }, -- yeni kısayol
      {
        "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Toggle comment"
      },
      {
        "<leader>/",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = "v",
        desc = "Toggle comment",
      }
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
}
