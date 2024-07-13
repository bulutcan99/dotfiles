return {
  {
    'saecki/crates.nvim',
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      local on_attach = require("configs.lspconfig").on_attach
      local capabilities = require("configs.lspconfig").capabilities
      vim.g.rustaceanvim = {
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      }
    end,
  },
}
