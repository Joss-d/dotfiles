return {
  "mason-org/mason.nvim",
  opts = {
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
