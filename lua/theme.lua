local themes = {
  "catppuccin",
  "everforest",
  "tokyonight",
}

-- 随机选择一个主题
math.randomseed(os.time()) -- 设置随机数种子
local random_theme = themes[math.random(#themes)] -- 随机选择主题

-- 应用主题
vim.cmd("colorscheme " .. random_theme)

-- 输出当前选定的主题名称
print("Applied theme: " .. random_theme)
