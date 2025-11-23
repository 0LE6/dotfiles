function _G.open_floating_terminal()
    local width = math.floor(vim.o.columns * 0.9)
    local height = math.floor(vim.o.lines * 0.7)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Open terminal
    local term_job_id = vim.fn.termopen(vim.o.shell, {
        on_exit = function(_, _)  -- called when terminal exits
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end
        end,
    })

    vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:ver25",
    "r-cr:hor20",
    "t:ver25-blinkon1", -- terminal mode: vertical blinking bar
}


    vim.cmd("startinsert")
end

vim.keymap.set(
    "n", 
    "<leader>t", 
    _G.open_floating_terminal, 
    { desc = "Open floating terminal" }
)

