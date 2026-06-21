return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })

            vim.keymap.set("n", "<leader>dB", function()
              dap.set_breakpoint(vim.fn.input("Condition: "))
            end, { desc = "Conditional Breakpoint" })

            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
            vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })

            vim.keymap.set("n", "<leader>de", dapui.open, { desc = "Open DAP UI" })
            vim.keymap.set("n", "<leader>dq", dapui.close, { desc = "Close DAP UI" })
            vim.keymap.set("n", "<leader>dg", dapui.toggle, { desc = "Toggle DAP UI" })

            vim.keymap.set("n", "<leader>dp", dap.repl.open, { desc = "Open REPL" })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
