return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- disable a keymap
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
    -- add a keymap
  end,
}
