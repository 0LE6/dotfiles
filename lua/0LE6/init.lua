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

-- Enable autoread when files change on disk
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

-- TODO: Prueba, borrar luego
print("Welcome back!")
