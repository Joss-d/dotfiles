return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    init = function()
      local opencode_cmd = "opencode"
      local snacks_terminal_opts = {
        win = {
          position = "right",
          enter = false,
        },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
          end,
          stop = function()
            require("snacks.terminal").get(opencode_cmd, snacks_terminal_opts):close()
          end,
          toggle = function()
            require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
          end,
        },
      }
    end,
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Demander à OpenCode",
      },
      {
        "<leader>os",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Actions OpenCode (prompts)",
      },
      {
        "<leader>ot",
        function()
          require("snacks.terminal").toggle("opencode", {
            win = { position = "right", enter = false },
          })
        end,
        mode = { "n", "t" },
        desc = "Afficher/Masquer OpenCode",
      },
      {
        "<leader>ou",
        function()
          require("opencode").command("session.half.page.up")
        end,
        desc = "Défiler OpenCode vers le haut",
      },
      {
        "<leader>od",
        function()
          require("opencode").command("session.half.page.down")
        end,
        desc = "Défiler OpenCode vers le bas",
      },
    },
  },
}
