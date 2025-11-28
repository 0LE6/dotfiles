vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

-- code folding using tree-sitter
-- zc: fold lvl | zo: open lvl | zM: close all | zR: open all
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- hide the default vim status bar under the lualine 
vim.opt.cmdheight = 1

-- vertical line cursor
vim.opt.guicursor = {
  "n-v-c-sm-i-ci-ve-r-cr-o:ver25-blinkon1"
}

-- No automatic comment insertion
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
