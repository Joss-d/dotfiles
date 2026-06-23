return {
  "danymat/neogen",
  dependencies = LazyVim.has("mini.snippets") and { "mini.snippets" } or {},
  cmd = "Neogen",
  keys = {
    {
      "<leader>cn",
      function()
        require("neogen").generate()
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
  opts = function(_, opts)
    local i = require("neogen.types.template").item
    local my_doxy = {
      { nil, "///", { no_results = true, type = { "func", "file", "class" } } },
      { nil, "/// \\file", { no_results = true, type = { "file" } } },
      { nil, "/// \\brief $1", { no_results = true, type = { "func", "file", "class" } } },
      { nil, "///", { no_results = true, type = { "func", "file", "class" } } },
      { nil, "", { no_results = true, type = { "file" } } },

      { nil, "///", { type = { "func", "class", "type" } } },
      { i.ClassName, "/// \\class %s", { type = { "class" } } },
      { i.Type, "/// \\typedef %s", { type = { "type" } } },
      { nil, "/// \\brief $1", { type = { "func", "class", "type" } } },
      { nil, "///", { type = { "func", "class", "type" } } },
      { nil, "/// \\pre $1", { type = { "func", "class", "type" } } },
      { nil, "/// \\post $1", { type = { "func", "class", "type" } } },
      { i.HasThrow, "/// njfgdfnjkdskjfnds" },
      { i.Tparam, "/// \\tparam %s $1" },
      { i.Parameter, "/// \\param %s $1" },
      { nil, "///", { type = { "func", "class", "type" } } },
      { i.Return, "/// \\return $1" },
      { nil, "///", { type = { "func", "class", "type" } } },
    }
    opts.languages = {
      cpp = {
        template = {
          annotation_convention = "custom",
          custom = my_doxy,
        },
      },
      python = {
        template = {
          annotation_convention = "numpydoc",
        },
      },
    }
    if opts.snippet_engine ~= nil then
      return
    end

    local map = {
      ["LuaSnip"] = "luasnip",
      ["mini.snippets"] = "mini",
      ["nvim-snippy"] = "snippy",
      ["vim-vsnip"] = "vsnip",
    }

    for plugin, engine in pairs(map) do
      if LazyVim.has(plugin) then
        opts.snippet_engine = engine
        return
      end
    end

    if vim.snippet then
      opts.snippet_engine = "nvim"
    end
  end,
}
