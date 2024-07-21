-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    -- merge options,conflict use value from rightmost map
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map("i", "jk", "<Esc>")
Map("v", "jk", "<Esc>")

-- ---------- 视觉模式 --------------
Map("v", "<s-h>", "^")
Map("v", "<s-l>", "$")
Map("n", "<s-h>", "^")
Map("n", "<s-l>", "$")
Map("n", "<C-s>", ":w<CR>")
--split
Map("n", "ss", "<C-w>s", { desc = "Go to left window", remap = true })
Map("n", "so", "<C-w>o", { desc = "Go to left window", remap = true })
Map("n", "<Down>", ":resize +2<CR>")
Map("n", "<Right>", ":vertical resize +2<CR>")
Map("n", "<Left>", ":vertical resize -2<CR>")
Map("n", "<Up>", ":resize -2<CR>")

local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end

Map("n", "<c-t>", "<cmd>Lspsaga term_toggle<cr>", { desc = "Terminal (Root Dir)" })
Map("t", "<C-t>", "<cmd>Lspsaga term_toggle<cr>", { desc = "Hide Terminal" })

-- lazygit
Map("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

-- bookmark
Map("n", "bmc", ":Telescope vim_bookmarks current_file<cr>")
Map("n", "bm", ":Telescope vim_bookmarks all<cr>")
Map("n", "<C-b>", ":Telescope buffers<Cr>")
Map("n", "<C-f>", ":Telescope live_grep<Cr>")
-- Map("n", "<C-h>", ":Telescope oldfiles<Cr>")
------------- 插件快捷键-------------
-- fittencode
Map("i", "<C-l>", function()
  require("fittencode").accept_all_suggestions()
end, { desc = "accept_all_suggestions" })

Map("i", "<a-k>", function()
  require("fittencode").dismiss_suggestions()
end, { desc = "dismiss_all_suggestions" })

Map("n", "<leader>fc", "<cmd>Fitten start_chat<cr>", { desc = "start_chat" })
Map("v", "<leader>ftc", "<cmd>Fitten translate_text_into_chinese<cr>", { desc = "翻译中文" })
Map("v", "<leader>fte", "<cmd>Fitten translate_text_into_english<cr>", { desc = "翻译英文" })
Map("v", "<leader>ftrc", "<cmd>Fitten refactor_code<cr>", { desc = "重构" })
Map("v", "<leader>ftoc", "<cmd>Fitten refactor_code<cr>", { desc = "优化" })
