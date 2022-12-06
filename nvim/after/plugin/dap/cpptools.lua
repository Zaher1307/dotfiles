local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/usr/bin/cpptools"
}

dap.configurations.c = {
    {
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/debug",
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb",
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description =  "enable pretty printing",
                ignoreFailures = false
            }
        }
    }
}
