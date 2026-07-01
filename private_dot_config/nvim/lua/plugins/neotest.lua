return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Other neotest dependencies here
    "orjangj/neotest-ctest",
    "nvim-neotest/neotest-python",
  },
  config = function()
    -- Optional, but recommended, if you have enabled neotest's diagnostic option
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Convert newlines, tabs and whitespaces into a single whitespace
          -- for improved virtual text readability
          local message = diagnostic.message:gsub("[\r\n\t%s]+", " ")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          args = { "--log-level", "DEBUG" },
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = "pytest",
          -- Custom python path for the runner.
          -- Can be a string or a list of strings.
          -- Can also be a function to return dynamic value.
          -- If not provided, the path will be inferred by checking for
          -- virtual envs in the local directory and for Pipenev/Poetry configs
          python = "python",
          -- Returns if a given file path is a test file.
          -- NB: This function is called a lot so don't perform any heavy tasks within it.
          -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
          -- instances for files containing a parametrize mark (default: false)
          pytest_discover_instances = true,
        }),
        -- require("neotest-ctest").setup({
        --   -- fun(string) -> string: Find the project root directory given a current directory
        --   -- to work from.
        --   root = function(dir)
        --     -- by default, it will use neotest.lib.files.match_root_pattern with the following entries
        --     return require("neotest.lib").files.match_root_pattern(
        --       -- NOTE: CMakeLists.txt is not a good candidate as it can be found in
        --       -- more than one directory
        --       "CMakePresets.json",
        --       "compile_commands.json",
        --       ".clangd",
        --       ".clang-format",
        --       ".clang-tidy",
        --       "build",
        --       "out",
        --       ".git"
        --     )(dir)
        --   end,
        --   -- What frameworks to consider when performing auto-detection of test files.
        --   -- Priority can be configured by ordering/removing list items to your needs.
        --   -- By default, each test file will be queried with the given frameworks in the
        --   -- following order.
        --   frameworks = { "gtest", "catch2", "doctest", "cpputest" },
        --   -- Command to run CTest. Can be used if the executable is not in your path or if you
        --   -- are running it in a container.
        --   cmd = { "ctest" },
        --   -- What extra args should ALWAYS be sent to CTest? Note that most of CTest arguments
        --   -- are not expected to be used (or work) with this plugin, but some might be useful
        --   -- depending on your needs. For instance:
        --   --   extra_args = {
        --   --     "--stop-on-failure",
        --   --     "--schedule-random",
        --   --     "--timeout",
        --   --     "<seconds>",
        --   --   }
        --   -- If you want to send extra_args for one given invocation only, send them to
        --   -- `neotest.run.run({extra_args = ...})` instead. see :h neotest.RunArgs for details.
        --   extra_args = {},
        -- }),
      },
    })
  end,
}
