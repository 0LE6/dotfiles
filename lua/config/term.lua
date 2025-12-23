local term_buf = nil

function toggle_terminal()
    -- if term buffer exists
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        vim.cmd("belowright split")
        vim.api.nvim_set_current_buf(term_buf)
        vim.cmd("startinsert")
    else
        -- if doesn't, create one
        vim.cmd("belowright split")
        vim.cmd("terminal")
        vim.cmd("startinsert")
        term_buf = vim.api.nvim_get_current_buf()
    end
end

function hide_terminal()
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(
            "<C-\\><C-n>", true, false, true
        ),
        "n", true
    )
    vim.cmd("hide")
end

vim.keymap.set("n", "<leader>m", toggle_terminal)

vim.keymap.set("t", "<Esc>", hide_terminal, { noremap = true, silent = true })

