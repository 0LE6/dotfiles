return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "junegunn/fzf",
            "ibhagwan/fzf-lua", -- for references
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },

        config = function()
            -- Setup Mason
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "lua_ls", 
                    "rust_analyzer" 
                },
            })


            -- Minimal LSP setup using new API
            local servers = { 
                "lua_ls", 
                "pyright", 
                "rust_analyzer" 
            }

            for _, ls in ipairs(servers) do
                vim.lsp.config(ls, {})
                vim.lsp.enable(ls)
            end

            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },   -- LSP suggestions
                    { name = "buffer" },     -- buffer words
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(
                        { behavior = cmp.SelectBehavior.Insert }
                    ),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(
                        { behavior = cmp.SelectBehavior.Insert }
                    ),
                    ["<CR>"] = cmp.mapping.confirm(
                        { select = true }
                    ),
                }),
            })

            
            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { 
                        buffer = event.buf, 
                        noremap = true, 
                        silent = true 
                    }

                    -- e → hover
                    vim.keymap.set(
                        "n", 
                        "e", 
                        vim.lsp.buf.hover, 
                        opts
                    )

                    -- gd → go to definition
                    vim.keymap.set(
                        "n", 
                        "gd", 
                        vim.lsp.buf.definition, 
                        opts
                    )

                    -- gr → references using fzf-lua
                    vim.keymap.set("n", "gr", function()
                        require("fzf-lua").lsp_references()
                    end, opts)

                end,
            })

            -- Diagnostics config
            vim.diagnostic.config({
                virtual_text = { 
                    severity = { 
                        min = vim.diagnostic.severity.ERROR 
                    } 
                },
                signs = { 
                    severity = { 
                        min = vim.diagnostic.severity.ERROR 
                    } 
                },
                underline = { 
                    severity = { 
                        min = vim.diagnostic.severity.ERROR 
                    } 
                },
                float = { severity = nil },
                update_in_insert = false,
            })
        end,
    },
}

