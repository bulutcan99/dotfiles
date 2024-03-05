return {
  "ray-x/go.nvim",
  lazy = false,
  ft = { "go", "gomod", "gosum", "gowork", "gotmpl" },
  dependencies = {
    {
      "ray-x/guihua.lua",
      build = "cd lua/fzy && make",
    },
  },
  config = function()
    require "custom.configs.go"
  end,
  build = ':lua require("go.install").update_all_sync()',
}
