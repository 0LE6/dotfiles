return {
    {
        "vague-theme/vague.nvim",
        config = function()
          require("vague").setup({
            transparent = false,
            bold = false,
            italic = false,
            
            colors = {
              -- bg = "#141415",
              bg = "",
              inactiveBg = "",
              fg = "#cdcdcd",
              floatBorder = "#878787",
              -- line = "#252530",
              line = "",
              comment = "#606079",
              builtin = "#b4d4cf",
              func = "#c48282",
              string = "#e8b589",
              number = "#e0a363",
              property = "#c3c3d5",
              constant = "#aeaed1",
              parameter = "#bb9dbd",
              visual = "#333738",
              error = "#d8647e",
              warning = "#f3be7c",
              hint = "#7e98e8",
              operator = "#90a0b5",
              keyword = "#6e94b2",
              type = "#9bb4bc",
              search = "#405065",
              plus = "#7fa563",
              delta = "#f3be7c",
            },
          })

          vim.cmd.colorscheme("vague")
        end,
    }
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,  -- load early
    --
    --     config = function()
    --         require('rose-pine').setup({
    --             variant = "moon",
    --             dark_variant = "moon",
    --             disable_background = true,
    --             styles = {
    --                 bold = false,
    --                 italic = false,
    --                 transparency = true,
    --             },
    --             palette = {
    --                 base = "#141415",
    --                 surface = "#1c1c24",
    --                 overlay = "#252530",
    --                 muted = "#606079",
    --                 text = "#cdcdcd",
    --                 subtle = "#878787",
    --                 love = "#d8647e",
    --                 gold = "#f3be7c",
    --                 foam = "#7e98e8",
    --                 pine = "#7fa563",
    --                 iris = "#6e94b2",
    --             },
    --             highlight_groups = {
    --                 Comment = { fg = "#606079" },
    --                 Function = { fg = "#c48282" },
    --                 String = { fg = "#e8b589" },
    --                 Number = { fg = "#e0a363" },
    --                 Constant = { fg = "#aeaed1" },
    --                 Identifier = { fg = "#c3c3d5" },
    --                 Keyword = { fg = "#6e94b2" },
    --                 Operator = { fg = "#90a0b5" },
    --                 Type = { fg = "#9bb4bc" },
    --
    --                 Visual = { bg = "#333738" },
    --                 Search = { bg = "#405065", fg = "#cdcdcd" },
    --
    --                 Error = { fg = "#d8647e" },
    --                 WarningMsg = { fg = "#f3be7c" },
    --                 Hint = { fg = "#7e98e8" },
    --
    --                 DiffAdd = { fg = "#7fa563" },
    --                 DiffChange = { fg = "#f3be7c" },
    --
    --                 FloatBorder = { fg = "#878787", bg = "none" },
    --                 NormalFloat = { bg = "none" },
    --                 },
    --             enable = {
    --                 terminal = true,
    --             },
    --         })
    --
    --         vim.cmd.colorscheme("rose-pine")
    --
    --         -- floating window highlights
    --         vim.api.nvim_set_hl(
    --             0, 
    --             "NormalFloat", 
    --             { bg = "none" }
    --         )
    --         vim.api.nvim_set_hl(
    --             0, 
    --             "FloatBorder", 
    --             { bg = "none" }
    --         )
    --     end,
    -- }
}

