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
        },
        rs = {
          icon = "",
          color = "#dea584",
          cterm_color = "173",
          name = "Rust"
        }, 
        html = {
          icon = "",              
          color = "#e34c26",
          cterm_color = "202",
          name = "Html"
        },
        css = {
          icon = "",              
          color = "#264de4",
          cterm_color = "68",
          name = "Css"
        },
        js = {
          icon = "",              
          color = "#f7df1e",
          cterm_color = "226",
          name = "JavaScript"
        },
        ts = {
          icon = "",              
          color = "#3178c6",
          cterm_color = "68",
          name = "TypeScript"
        },
        json = {
          icon = "",              
          color = "#cbcb41",
          cterm_color = "185",
          name = "Json"
        },
      },      
      default = true
    })
  end}


