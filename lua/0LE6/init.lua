-- SAFELY OVERRIDE vim.notify (fix stack overflow issue)
-- Save the original notify function before overwriting it
local notify_orig = vim.notify

vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("position_encoding param is required") then
    return  -- Ignore this specific message
  end
  notify_orig(msg, level, opts)  -- Use original notify to avoid infinite loop
end

-- Optionally expose original notify globally (not required)
vim.notify_orig = notify_orig

-- Load personal modules
require("0LE6.remap")
require("0LE6.lazy_init")
require("0LE6.settings")

-- Automatically reload files if changed on disk (e.g., after git pull)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

-- Temporary debug message
print("Welcome back!")

