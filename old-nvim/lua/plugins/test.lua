return {
  {
    "olimorris/neotest-phpunit",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-phpunit" } },
  },
}
