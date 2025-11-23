return {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" }, 
    config = function()
        require("Comment").setup()
    end,

    -- usage
    -- gcc : comment current line
    -- gc on selected : siple comment lines
    -- gb on selected : block comment lines
    -- i.e. gc5j : comment from current to 5 lines below
}

