return {
  "nvim-neotest/neotest",
  ft = { "go", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  dependencies = {
    "nvim-neotest/neotest-go",
    "haydenmeade/neotest-jest",
  },
  config = function()
    require "custom.configs.neotest"
  end,
}
