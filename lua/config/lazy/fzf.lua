return {
    "ibhagwan/fzf-lua",
    dependencies = {}, -- i.e. devicons if they're needed
    opts = {
        winopts = { 
            border = "rounded",

        },
        fzf_opts = {
        },
        files = {
            actions = {
                
                ["default"] = function(selected) 
                    vim.cmd("edit " .. selected[1]) 
                end,
                ["ctrl-s"] = function(selected) 
                    vim.cmd("split " .. selected[1]) 
                end,
                ["ctrl-v"] = function(selected) 
                    vim.cmd("vsplit " .. selected[1]) 
                end,
                ["ctrl-t"] = function(selected) 
                    vim.cmd("tabedit " .. selected[1]) 
                end,
            },
        },
    },
    config = function(_, opts)
        local fzf = require("fzf-lua")
        fzf.setup(opts)

        -- remap
        vim.keymap.set(
            "n", "<leader>ff", fzf.files, { desc = "Find file"}
        )
        vim.keymap.set(
            "n", "<leader>fg", fzf.live_grep, { desc = "Find content"}
        )
    end,
}
