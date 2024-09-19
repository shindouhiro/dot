-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.conceallevel = 0
opt.backup = false -- 不创建备份文件
opt.swapfile = false -- 不创建交换文件
opt.writebackup = false -- 编辑时不创建备份文件
opt.undofile = false -- 不创建撤销文件
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.fixeol = false -- Turn off appending new line in the end of a file
-- opt.timeoutlen = 3000
--
