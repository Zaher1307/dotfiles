require("dap-vscode-js").setup {
    node_path = "node",
    debugger_path = "/home/zaher/.opt/vscode-js-debug",
    adapters = { "pwa-node" },
}

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            name = "debug file",
            type = "pwa-node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
        }
    }
end
