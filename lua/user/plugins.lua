local plugin_configs = {
  require("user.plugins.alpha"),
  require("user.plugins.auto-session"),
  require("user.plugins.better-escape"),
  require("user.plugins.copilot"),
  require("user.plugins.copilot-chat"),
  require("user.plugins.edgy"),
  require("user.plugins.git-blame"),
  require("user.plugins.goto-preview"),
  require("user.plugins.leap"),
  require("user.plugins.makeit"),
  require("user.plugins.markdown-preview"),
  require("user.plugins.mason-tool-installer"),
  require("user.plugins.minimap"),
  require("user.plugins.neo-tree"),
  require("user.plugins.neoscroll"),
  require("user.plugins.noice"),
  require("user.plugins.numb"),
  require("user.plugins.nvim-builtin-improvments"),
  require("user.plugins.outlines"),
  require("user.plugins.python"),
  require("user.plugins.rainbow-csv"),
  require("user.plugins.rainbow-delimiters"),
  require("user.plugins.spectre"),
  require("user.plugins.themes"),
  require("user.plugins.tmux"),
  require("user.plugins.todo-comments"),
  require("user.plugins.treesitter-context"),
  require("user.plugins.trouble"),
  require("user.plugins.vimtex"),
  require("user.plugins.vim-polyglot"),
  require("user.plugins.vim-surround"),
  require("user.plugins.window-picker"),
}

local plugins = {}
for _, config in ipairs(plugin_configs) do
  for _, plugin in ipairs(config) do
    table.insert(plugins, plugin)
  end
end

lvim.plugins = plugins
