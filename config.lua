reload "user.neorg"
reload "user.plugins"
reload "user.options"
reload "user.keymaps"
reload "user.autocommands"

reload "user.nvimtree"
reload "user.lualine"
reload "user.modicator"
reload "user.lsp"
reload "user.smoothie"
-- reload "user.harpoon"
reload "user.webdev-icons"
reload "user.cybu"
reload "user.neotest"
reload "user.surround"
reload "user.bookmark"
reload "user.todo-comments"
-- reload "user.jaq"
-- reload "user.fidget"
-- reload "user.lab"
reload "user.git"
reload "user.zen-mode"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.bqf"
reload "user.dial"
reload "user.numb"
reload "user.treesitter"
-- reload "user.neogit"
reload "user.colorizer"
reload "user.lualine"
reload "user.tabnine"
-- reload "user.copilot"
-- reload "user.chatgpt"
reload "user.whichkey"
-- reload "user.neoai"
reload "user.cmp"
reload "nostr"
reload "user.astro-tools"
reload "user.matchup"
reload "user.modicator"



local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
require("dap-vscode-js").setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost", "node" }, -- which adapters to register in nvim-dap
}

local js_based_languages = { "typescript", "javascript", "typescriptreact" }


for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {

    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = 'Start Chrome with "localhost"',
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    },
  }
end

table.insert(vim._so_trails, "/?.dylib")

require("dap.ext.vscode").load_launchjs(nil, {
  ["pwa-node"] = js_based_languages,
  ["node"] = js_based_languages,
  ["chrome"] = js_based_languages,
  ["pwa-chrome"] = js_based_languages,
})

vim.api.nvim_set_keymap("i", "<C-q>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-w>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"

-- default config
require("image").setup {
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      sizing_strategy = "auto",
      download_remote_images = true,
      clear_in_insert_mode = false,
      only_render_image_at_cursor = false,
    },
    neorg = {
      enabled = true,
      download_remote_images = true,
      clear_in_insert_mode = false,
      only_render_image_at_cursor = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  kitty_method = "normal",
  kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
}
