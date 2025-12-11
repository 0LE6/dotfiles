return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,  -- load early

        config = function()
            require('rose-pine').setup({
                variant = "moon",
                dark_variant = "moon",
                disable_background = true,
                styles = {
                    bold = false,
                    italic = false,
                    transparency = true,
                },
                enable = {
                    terminal = true,
                },
            })

            vim.cmd.colorscheme("rose-pine")

            -- floating window highlights
            vim.api.nvim_set_hl(
                0, 
                "NormalFloat", 
                { bg = "none" }
            )
            vim.api.nvim_set_hl(
                0, 
                "FloatBorder", 
                { bg = "none" }
            )
        end,
    }
}

