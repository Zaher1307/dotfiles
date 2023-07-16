local dap = require("dap")
local dapui = require("dapui")

-- Config --
vim.fn.sign_define("DapBreakpoint",          { text='●', texthl='', linehl="debugBreakpoint", numhl="debugBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text='◆', texthl='', linehl="debugBreakpoint", numhl="debugBreakpoint" })
vim.fn.sign_define("DapStopped",             { text='▶', texthl='', linehl="debugPC",         numhl="debugPC" })

local conditional_breakpoint = function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end

local function after_session()
    dapui.close()
    dap.repl.close()
end

-- Mappings --
vim.keymap.set('n', "<F5>", dap.continue)
vim.keymap.set('n', "<F6>", dap.terminate)
vim.keymap.set('n', "<F7>", dap.restart)
vim.keymap.set('n', "<F8>", conditional_breakpoint)
vim.keymap.set('n', "<F9>", dap.toggle_breakpoint)
vim.keymap.set('n', "<S-F9>", dap.clear_breakpoints)
vim.keymap.set('n', "<F22>", dap.run_to_cursor)
vim.keymap.set('n', "<F10>", dap.step_over)
vim.keymap.set('n', "<F11>", dap.step_into)
vim.keymap.set('n', "<F12>", dap.step_out)

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.after.event_terminated["dapui_config"] = after_session
dap.listeners.after.event_exited["dapui_config"] = after_session
dap.listeners.after.disconnect["dapui_config"] = after_session
