-- Aquí se llama a telscope para su instalación como plugin "buscador de files, palabras etc"
-- https://github.com/nvim-telescope/telescope.nvim
return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },

	-- Y ahora pasamos a la configuración de los "shortcut" para emplearlo.
	-- Creamos una función a la que decimos que mediante el require, el setup de nuestro telescope se haga con lo que configueremos dentro.
	
	config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        -- Configura Telescope
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<leader><tab>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            if selection then
                                vim.cmd('tabnew ' .. selection.path)
                            end
                        end,
                    },
                },
            },
        })
		require('telescope').setup({})
		
		local builtin = require('telescope.builtin')
		-- leader ff -> Lists files in your current working directory, respects .gitignore
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

		-- leader fg -> Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep -> sudo apt install ripgrep)
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

		-- leader fd -> Searches for the string under your cursor or selection in your current working directory
		vim.keymap.set('n', '<leader>fd', 
			function()
                builtin.grep_string({ search = vim.fn.input("Search: ") })
        	end)
	end
}

