return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.preset("recommended")

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true, desc = "LSP mapping" }
 
            --[[------------------------------------------------------------------------
            LSP KEYMAPS GUIDE
            ------------------------------------------------------------------------------
            e     => Show hover info under cursor
            gd    => Jump to definition
            gr    => List references in Telescope
            ------------------------------------------------------------------------------]]

            vim.keymap.set("n", "e", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        end)

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
            },
        })
    end,
}

