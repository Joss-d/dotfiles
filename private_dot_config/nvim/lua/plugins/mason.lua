return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = { "gitui" },
    -- github = {
    --   download_url_template = https://TODO/remote-github/%s/releases/download/%s/%s,
    -- },
    -- npm = {
    --   install_args = { "--registry", https:/TODO/remote-npm },
    -- },
    ui = {
      check_outdated_packages_on_open = false,
    },
    registry_cache = {
      refresh = false,
    },
  },
  keys = {
    {
      "<leader>gG",
      function()
        Snacks.terminal({ "gitui" })
      end,
      desc = "GitUi (cwd)",
    },
    {
      "<leader>gg",
      function()
        Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.get() })
      end,
      desc = "GitUi (Root Dir)",
    },
  },
  init = function()
    -- delete lazygit keymap for file history
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimKeymaps",
      once = true,
      callback = function()
        pcall(vim.keymap.del, "n", "<leader>gf")
        pcall(vim.keymap.del, "n", "<leader>gl")
      end,
    })
  end,
}
