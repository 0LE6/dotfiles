-- Aquí se llama a telscope para su instalación como plugin "buscador de files, palabras etc"
-- https://github.com/nvim-telescope/telescope.nvim

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

		telescope.setup({})
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files"})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope find words with live grep"})
	end
}
