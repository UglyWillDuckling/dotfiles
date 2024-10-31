return {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint" },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        KNOW = { icon = "📖", color = "default" }, -- blueish
        IDEA = { icon = "💡", color = "#ffff00" }, -- yellow
        SUGGEST = { icon = " ", color = "#ec46a2" },
        THOUGHT = { icon = "🧠", color = "#ff4de2" }, -- purple
        QUESTION = { icon = "❓", color = "hint" },
      },
    },
  },
}
-- IDEA:
-- 🧠 🚂 ☁ 👋 🧠 :check: 👀 👀 👁 🧠 ❓

--IDEA: https://github.com/folke/todo-comments.nvim
-- :brain: 🧠
-- THOUGHT: hello
--
-- KNOW: you need to know this
-- INFO: hello
-- TODO"": hello
-- HACK: hacked this one
-- WARN: don't do this
-- PERF: issue with timing
-- NOTE: remember this
-- TEST: need to test
-- SUGGEST: code suggestions
