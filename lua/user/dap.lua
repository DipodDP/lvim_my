local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
require("dap-vscode-js").setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = mason_path .. "packages/js-debug-adapter",                                           -- Path to vscode-js-debug installation.
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
