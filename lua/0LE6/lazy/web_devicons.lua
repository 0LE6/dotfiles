-- Configuramos el plugin "nvim-web-devicons" para que nos salgan los iconos de diferentes tipos de extensiones.
-- https://github.com/nvim-tree/nvim-web-devicons
return {
	'nvim-web-devicons',

	config = function()
    require('nvim-web-devicons').setup({
      override = {
        sh = {
          icon = "",
          color = "#89e051",
          cterm_color = "113",
          name = "Shell"
        }
      },
      default = true
    })
  end}


