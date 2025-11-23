return {
   "stevearc/oil.nvim",
   dependencies = {},
   opts = {
       default_file_explorer = true,
       view_options = {
           show_hidden = true,
           natural_order = "fast",
           sort = {
               { "type", "asc" },
               { "name", "asc" },
           },
       },
       keymaps = {
           ["-"] = { 
               "actions.parent", 
               mode = "n", 
               desc = "Go to parent directory" 
           },
           ["<CR>"] = { 
               "actions.select", 
               mode = "n", 
               desc = "Open file or directory" 
           },
           ["<C-s>"] = { 
               "actions.select", 
               mode = "n", 
               opts = { horizontal = true }, 
               desc = "Open in split" 
           },
           ["<C-v>"] = { 
               "actions.select", 
               mode = "n", 
               opts = { vertical = true }, 
               desc = "Open in vertical split" 
           },
           ["<C-t>"] = { 
               "actions.select", 
               mode = "n", 
               opts = { tab = true },
               desc = "Open in new tab" 
           },
           ["g?"] = { 
               "actions.show_help", 
               mode = "n", 
               desc = "Show Oil help" 
           },
       },
       -- TODO: review
       buf_options = {
           buflisted = false,
           bufhidden = "hide",
       },
       win_options = {
           wrap = false,
           signcolumn = "no",
           cursorcolumn = false,
           foldcolumn = "0",
           list = false,
       },
   },
   config = function(_, opts)
       require("oil").setup(opts)

       vim.keymap.set(
           "n", "<leader>e", "<cmd>Oil<CR>", 
           { desc = "Open file explorer (Oil)" }
       )

        
   end,
}
