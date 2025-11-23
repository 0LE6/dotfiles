return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "angular",
            "bash",
            "c",
            "cmake",
            "cpp",
            "css",
            "dockerfile",
            "go",
            "html",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown", 
            "markdown_inline",
            "matlab",
            "python",
            "rust",
            "vim"
            
        },
        indent = {
            enable = true
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
}

