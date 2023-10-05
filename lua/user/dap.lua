local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    return
  end

dap.adapters.go = function(callback, _)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = { nil, stdout },
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print("dlv exited with code", code)
      end
    end)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require("dap.repl").append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(function()
      callback { type = "server", host = "127.0.0.1", port = port }
    end, 100)
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug with args",
      request = "launch",
      program = "${file}",
      args = function()
        local argument_string = vim.fn.input "Program arg(s): "
        return vim.fn.split(argument_string, " ", true)
      end,
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  }

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

