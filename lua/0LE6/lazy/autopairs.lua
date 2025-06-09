-- https://github.com/windwp/nvim-autopairs
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')

        npairs.setup({
            disable_filetype = { "TelescopePrompt", "vim" },
            enable_check_bracket_line = false,
            check_ts = true,
        })

        npairs.add_rules({
            Rule("<", ">"),
            Rule("'", "'")
        })
    end
}
