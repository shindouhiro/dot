-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.snippet")
-- init.lua
--[[ local FloatingWindow = require("window")

local my_window = FloatingWindow:new({
  height = 10,
  width = 50,
  row = 5,
  col = 10,
  content = {
    "This is a floating window",
    "created using Lua in Neovim",
  },
  highlight = true,
  winblend = 10,
})

-- 添加命令
vim.api.nvim_create_user_command("FloatWindowToggle", function()
  my_window:toggle()
end, {})

vim.api.nvim_create_user_command("FloatWindowShow", function()
  my_window:show()
end, {})

vim.api.nvim_create_user_command("FloatWindowHide", function()
  my_window:hide()
end, {}) ]]
