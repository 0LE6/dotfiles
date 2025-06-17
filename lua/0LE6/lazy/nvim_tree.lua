-- Aquí realizamos la configuración correspondiente para tener la versión "cool" de NerdTree para NeoVim, que consiste básicamente en la disposición visual complementaria de la organización de carpetas y sus contenidos de archivos.
--
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation

local function my_on_attach(bufnr)
	local api = require 'nvim-tree.api'

	local function opts(desc)
		return {
			desc = 'nvim-tree: ' .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
	end

	-- El mappeo de los shortcuts personalizados se realizan en base a su API
    
    -- Abrir un file, con un "Enter" o un "doble click" con el mouse sobre él.
	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    
    -- Con espacio + "q" abrimos y cerramos el tree.
    vim.keymap.set('n', '<leader>q', function()
        api.tree.toggle()
    end)

    -- Con leader + "r" pasamos el focus del file al tree de nuevo.
    vim.keymap.set('n', '<leader>r', function()
        api.tree.focus()
    end)

    -- Intento abrir en nueva tab un file desde el tree:
    vim.keymap.set('n', '<leader><Tab>', function ()
        api.node.open.tab()
    end)

    -- File operations
    vim.keymap.set('n', 'a', api.fs.create,        opts('Create file/folder'))
    vim.keymap.set('n', 'd', api.fs.remove,        opts('Delete file/folder'))
    vim.keymap.set('n', 'r', api.fs.rename,        opts('Rename file/folder'))
    vim.keymap.set('n', 'x', api.fs.cut,           opts('Cut'))
    vim.keymap.set('n', 'c', api.fs.copy.node,     opts('Copy'))
    vim.keymap.set('n', 'p', api.fs.paste,         opts('Paste'))
    vim.keymap.set('n', 'R', api.tree.reload,      opts('Refresh'))

end

return {
	'nvim-tree/nvim-tree.lua',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},

	config = function()
		require('nvim-tree').setup {
            -- Le pasamos la configuración que realizamos antes
			on_attach = my_on_attach,
		}
	end
}
