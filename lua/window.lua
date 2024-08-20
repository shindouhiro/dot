-- floating_window.lua
local api = vim.api

local FloatingWindow = {}

function FloatingWindow:new(opts)
  local obj = {
    buf = nil,
    win = nil,
    opts = opts or {},
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function FloatingWindow:open()
  local opts = self.opts
  local height = opts.height or 10
  local width = opts.width or 40
  local row = opts.row or math.floor((vim.o.lines - height) / 2)
  local col = opts.col or math.floor((vim.o.columns - width) / 2)

  local borders = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  local content = opts.content or {}
  if type(content) == "string" then
    content = { content }
  end

  self.buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(self.buf, 0, -1, false, content)

  self.win = api.nvim_open_win(self.buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = borders,
  })

  api.nvim_win_set_option(self.win, "winblend", opts.winblend or 0)
  api.nvim_win_set_option(self.win, "signcolumn", "no")

  if opts.highlight then
    api.nvim_win_set_option(self.win, "winhl", "Normal:Normal")
  end

  -- 添加键盘监听
  vim.api.nvim_buf_set_keymap(
    self.buf,
    "n",
    "q",
    "<cmd>lua require'floating_window'.FloatingWindow:close()<CR>",
    { noremap = true, silent = true }
  )

  return self
end

function FloatingWindow:close()
  if self.win and api.nvim_win_is_valid(self.win) then
    api.nvim_win_close(self.win, true)
    self.win = nil
    self.buf = nil
    -- 移除键盘监听
    vim.api.nvim_buf_del_keymap(self.buf, "n", "q")
  end
end

-- New command functions
function FloatingWindow:toggle()
  if self.win and api.nvim_win_is_valid(self.win) then
    self:close()
  else
    self:open()
  end
end

function FloatingWindow:show()
  if not self.win then
    self:open()
  end
end

function FloatingWindow:hide()
  if self.win then
    self:close()
  end
end

return FloatingWindow
