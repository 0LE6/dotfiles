# Adapted to NVIM 0.12
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
        "bash",
        "c", "cmake", "cpp", "css",
        "dockerfile",
        "go",
        "html",
        "java", "javascript", "json",
        "lua",
        "python",
        "rust",
        "vim",
        "markdown", "markdown_inline",
        "vimdoc",
        "query",
    })

    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            pcall(vim.treesitter.start, args.buf)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
    end,
}
