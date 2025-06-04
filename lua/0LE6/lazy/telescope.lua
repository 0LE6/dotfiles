-- Aquí se llama a telscope para su instalación como plugin "buscador de files, palabras etc"
-- https://github.com/nvim-telescope/telescope.nvim

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
  
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<leader><tab>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            if selection and selection.filename then
                                vim.cmd('tabnew ' .. selection.filename)
                                vim.cmd('' .. selection.lnum)  -- Ir a la línea correcta
                            else
                                print("Error: No se encontró el archivo.")
                            end
                        end,
                    },
                    n = {
                        ["<leader><tab>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            if selection and selection.filename then
                                vim.cmd('tabnew ' .. selection.filename)
                                vim.cmd('' .. selection.lnum)  -- Ir a la línea correcta
                            else
                                print("Error: No se encontró el archivo.")
                            end
                        end,
                    },
                },
            },
        })

		require('telescope').setup({})
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files"})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope find words with live grep"})
	end
}
