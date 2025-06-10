require("0LE6.remap")
require("0LE6.lazy_init")
require("0LE6.settings")

-- termporal
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("position_encoding param is required") then
    return
  end
  vim.notify_orig(msg, level, opts)
end

-- Guarda el notify original en caso de necesitarlo
vim.notify_orig = vim.notify


-- TODO: Prueba, borrar luego
print("Welcome back!")
