-- file explorer
vim.keymap.set(
    "n", 
    "<leader>e", 
    vim.cmd.Ex, { desc = "Open Ex (netrw)" }
)

-- Navigate tabs with leader + Tab / Shift-Tab
vim.keymap.set(
    'n', 
    '<Tab>', 
    ':tabnext<CR>', 
    { noremap = true, silent = true }
)
vim.keymap.set(
    'n',
    '<S-Tab>', 
    ':tabprevious<CR>', 
    { noremap = true, silent = true }
)


