require("dap-vscode-js").setup {
    node_path = "node",
    debugger_path = "/home/zaher/.opt/vscode-js-debug",
    adapters = { "pwa-node" },
}

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
      {
        name = "Debug File",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach Process",
        type = "pwa-node",
        request = "attach",
        processId = function()
          require("dap.utils").pick_process("node --inspect")
        end,
      },
      {
        name = "Debug Jest Tests",
        type = "pwa-node",
        request = "launch",
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
      },
  }
end
