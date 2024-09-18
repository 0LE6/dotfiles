return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Configuración para obtener info sobre un componente del lenguaje mediante LSP,
        -- posicionas el cursor sobre una palabra y le da a la "e" en modo normal.
        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'e', '<cmd>lua vim.lsp.buf.hover()<CR>', {
                noremap = true,
                silent = true,
                desc = 'Show hover information'
            })

            -- Update: ir a definición, implementación y referencia.
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {
                noremap = true,
                silent = true, 
                desc = 'Go to the definition'
            })

            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CR>', '<cmd>lua vim.lsp.buf.definition()<CR>', {
                noremap = true,
                silent = true,
                desc = 'Go to definition/implementation'
            })

            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', {
                noremap = true,
                silent = true,
                desc = 'Find references with Telescope'
            })
        end

        -- Configuración de las capacidades para LSP y nvim-cmp.
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Copia y pega de https://lsp-zero.netlify.app/v3.x/getting-started.html#automatic-setup
        -- Modificación del setup para lsp-zero, que facilita la configuración de LSP.
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset('recommended')
        lsp_zero.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        -- Configuración de nvim-cmp para autocompletado
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = {
                -- Con tabulación arriba y abajo nos movemos por las sugerencias.
                ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<CR>'] = cmp.mapping.confirm({ select = true })  -- Enter para confirmar la selección
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            })
        })

        -- En esta sección manejamos los LSP para lso idiomas que queramos y le pasamos algunas configuraicones que realizamos antes.
        -- to learn how to use mason.nvim
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- NOTE: Aquí metemos todos los LSP de los lenguajes que querramos 
            ensure_installed = {
                'rust_analyzer',
                'pyright',
                'lua_ls'

            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
            },
        })
    end
}
