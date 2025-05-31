-- https://github.com/akinsho/toggleterm.nvim

local modes = { 't', 'n' }
local keys = { '<Esc>', '<leader>t' }
local cmds = { '<cmd>close<CR>', '<cmd>ToggleTerm<CR>' }
local opts = { noremap = true, silent = true }

local function close_terminal_when_on_open(term)
    -- close with Esc when we're inside the terminal mode
    vim.api.nvim_buf_set_keymap(term.bufnr, modes[1], keys[1], cmds[1], opts)
end

local function open_terminal_when_on_close()
    -- open terminal when there's none with <leader>t 
    vim.api.nvim_set_keymap(modes[2], keys[2], cmds[2], opts)
end

return {
    'akinsho/toggleterm.nvim',

    config = function ()
        require('toggleterm').setup({
            open_mapping = false,
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'float',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
            },
            on_open = close_terminal_when_on_open,
        })
        open_terminal_when_on_close()
    end
}
