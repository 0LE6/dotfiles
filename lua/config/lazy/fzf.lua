return {
    "ibhagwan/fzf-lua",
    dependencies = {}, -- i.e. devicons if they're needed
    opts = {
        fzf_colors = {
            true,
            ["bg+"] = { "bg", { "PmenuSel" } },
            ["hl+"] = { "fg", "String"  },
            ["info"] = { "fg", "String" },
            ["gutter"] = {"fg", { "Normal" } },
        },
        winopts = { 
            border = "rounded",
            winbled = 100,
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
        git = {
            status = {
                actions = {},
            },
        },
    },
    config = function(_, opts)
        local fzf = require("fzf-lua")
        local git = require("config.lazy.modules.git")

        opts.git.status.actions["default"] = fzf.actions.git_diff
        fzf.setup(opts)

        -- inside file list
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- outside border bg
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

        -- -- Files
        vim.keymap.set(
            "n",
            "<leader>ff",
            fzf.files, { desc = "Find file"}
        )
        vim.keymap.set(
            "n",
            "<leader>fg",
            fzf.live_grep, { desc = "Find content"}
        )

        -- -- Git
        -- left → stage
        -- right → unstage
        -- ctrl+x → restore
        vim.keymap.set(
            "n",
            "<leader>gs",
            fzf.git_status, { desc = "Git status" }
        )
        vim.keymap.set(
            "n",
            "<leader>gb",
            fzf.git_branches, { desc = "Switch Git branch" }
        )

        -- Extra Git flows
        vim.keymap.set(
            "n",
            "<leader>gc",
            git.commit, { desc = "Git commit" }
        )
        vim.keymap.set(
            "n",
            "<leader>gu",
            git.undo_last_commit, { desc = "Undo last commit" }
        )
        vim.keymap.set(
            "n",
            "<leader>gps",
            git.push, { desc = "Git push current branch" }
        )
        vim.keymap.set(
            "n",
            "<leader>gpl",
            git.pull, { desc = "Git pull current branch" }
        )
        vim.keymap.set(
            "n",
            "<leader>gf",
            git.fetch, { desc = "Git fetch" }
        )
    end,
}
