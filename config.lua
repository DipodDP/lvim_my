reload "user.dap"
reload "user.modicator"
-- reload "user.chatgpt"
reload "user.rest"
reload "user.metals"
reload "user.image"
-- reload "user.neorg"
reload "user.plugins"
reload "user.options"
reload "user.keymaps"
reload "user.autocommands"

reload "user.nvimtree"
reload "user.lualine"
reload "user.modicator"
reload "user.lsp"
reload "user.smoothie"
-- reload "user.harpoon"
reload "user.webdev-icons"
reload "use.cybu"
reload "user.surround"
reload "user.neotest"
reload "user.todo-comments"
-- reload "user.jaq"
-- reload "user.fidget"
-- reload "user.lab"
reload "user.git"
reload "user.zen-mode"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.bqf"
reload "user.dial"
reload "user.numb"
reload "user.treesitter"
-- reload "user.neogit"
reload "user.colorizer"
reload "user.lualine"
reload "user.tabnine"
reload "user.neoscroll"
reload "user.whichkey"
-- reload "user.neoai"
reload "user.cmp"
reload "nostr"
reload "user.astro-tools"
reload "user.matchup"
reload "user.dotenv"




vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<space>f', function()
  vim.lsp.buf.format { async = true }
end)

require 'lspconfig'.csharp_ls.setup {}

require("swagger-preview").setup({
  -- The port to run the preview server on
  port = 8000,
  -- The host to run the preview server on
  host = "localhost",
})

-- require("transparent").setup({ -- Optional, you don't have to run setup.
--   groups = {                   -- table: default groups
--     'lualine_c_replace', 'lualine_c_visual', 'lualine_c_insert', 'lualine_c_normal',
--     'Float', 'NormalFloat',
--     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--     'EndOfBuffer',
--   },
--   extra_groups = {},   -- table: additional groups that should be cleared
--   exclude_groups = {}, -- table: groups you don't want to clear
-- })



-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    CursorLine = {
      blend = vim.o.pumblend,
      bg = "NONE",
    },
    CursorLineNr = {
      blend = vim.o.pumblend,
      bg = "NONE",
    },
    lualine_c_replace = {
      -- guibg = "NONE",
    },
    lualine_c_visual = {
      -- guibg = "NONE",
    },
    lualine_c_normal = {
      -- guibg = "NONE",
    },
    lualine_c_insert = {
      -- guibg = "NONE",
    },
    Pmenu = {
      blend = 0,
      bg = "NONE"
    }
  },
  dim_inactive = false,
  transparent_mode = true,
})
