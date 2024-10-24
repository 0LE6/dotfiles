-- Copiado de y modificado a raíz de: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/colors.lua
-- Other version
function settingColors(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    
    -- Desactivar el resalte de la línea actual en los buffers normales
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

    -- Desactivar el resalte de la línea actual en nvim-tree
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "none" })

    -- Ajustar los números de línea para que sean grisáceos
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c6370", bg = "none" }) -- Color gris para los números de línea
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#abb2bf", bg = "none", bold = true })

    -- Hacer que la columna de signos (SignColumn) sea transparente
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

    -- Hacer que los íconos de diagnóstico tengan fondo transparente
    vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "none" })

    -- Resaltar el texto flotante (por ejemplo, cuadros de diálogo)
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#5c6370" }) -- Borde flotante transparente con color gris
end

-- Command to switch themes
vim.api.nvim_create_user_command('ColorTheme', function(opts)
    settingColors(opts.args)
end, {
    nargs = 1,
    complete = function()
        return {"rose-pine", "tokyonight", "kanagawa"}
    end
})

return {
     {
         -- "folke/tokyonight.nvim",
         -- config = function()
         --     require("tokyonight").setup({
         --         style = "storm", -- Estilo, elige entre storm, moon, night y day
         --         transparent = true, -- Fondo transparente como en RosePine
         --         terminal_colors = true, -- Colores para el terminal
         --         styles = {
         --             comments = { italic = false },
         --             keywords = { italic = false },
         --             sidebars = "transparent", -- Transparencia en las barras laterales
         --             floats = "transparent", -- Transparencia en ventanas flotantes
         --         },
         --     })
         --     settingColors("tokyonight") -- Aplicamos los mismos estilos con la paleta de TokyoNight
         -- end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                variant = "auto",
                disable_background = true,
                styles = {
                    italic = false,
                    transparency = true,
                },
            })
            settingColors("rose-pine")
        end
    },
    --
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require('kanagawa').setup({
    --             transparent = true,
    --             commentStyle = { italic = false },
    --             keywordStyle = { italic = false },
    --         })
    --         settingColors("kanagawa")
    --     end
    -- } 
}
