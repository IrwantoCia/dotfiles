local dap = require('dap')
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()

dapui.setup({
  layouts = {
    {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide IDs as strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left", -- Can be "left" or "right"
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "right", -- Can be "bottom" or "top"
    },
  }
})

-- map keys for debugger
vim.api.nvim_set_keymap('n', '<leader>d8', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d5', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d6', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d7', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B',
  '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp',
  '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".run_last()<CR>', { noremap = true, silent = true })


require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

dap.configurations.javascript = {
  -- {
  --   type = "pwa-node",
  --   request = "launch",
  --   name = "Finskor Services",
  --   program = "~/Documents/personal/upwork/finskor-services/main-service/index.js",
  --   cwd = "${workspaceFolder}/main-service",
  --   runtimeExecutable = "/home/buggy/.nvm/versions/node/v16.16.0/bin/nodemon",
  -- },
  {
    type = "pwa-node",
    request = "launch",
    name = "Weddingserv Services",
    program = "~/Documents/personal/upwork/weddingserv_backend/src/index.js",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "/home/buggy/.nvm/versions/node/v18.6.0/bin/nodemon",
    env = { NODE_ENV = "development" }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Gama Backend App",
    program = "/home/buggy/Documents/crimson/gama-backend-app/src/index.js",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "/home/buggy/.nvm/versions/node/v18.6.0/bin/nodemon",
    env = { NODE_ENV = "development" }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Gama Event Backend App",
    program = "/home/buggy/Documents/crimson/gama-event-backend-app/src/index.js",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "/home/buggy/.nvm/versions/node/v18.6.0/bin/nodemon",
    env = { NODE_ENV = "development" }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require 'dap.utils'.pick_process,
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Debug Jest Tests",
    -- trace = true, -- include debugger info
    runtimeExecutable = "node",
    runtimeArgs = {
      "./node_modules/jest/bin/jest.js",
      "--runInBand",
    },
    rootPath = "${workspaceFolder}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    internalConsoleOptions = "neverOpen",
  }
  --{
  --    type = "pwa-node",
  --    request = "attach",
  --    name = "Attach backend debugger",
  --    port = 9229,
  --    cwd = "${workspaceFolder}",
  --    localRoot = "${workspaceFolder}",
  --    remoteRoot = "${workspaceFolder}",
  --}
}

--dap.configurations.typescript = {
--    {
--        type = "pwa-node",
--        request = "attach",
--        name = "Attach backend debugger",
--        port = 9229,
--        cwd = "${workspaceFolder}",
--        localRoot = "${workspaceFolder}",
--        remoteRoot = "${workspaceFolder}",
--    }
--}


require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    }
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "/home/buggy/go/bin/dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- dap icon
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'red', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
