--****************************************************************************--
--*                               [init.lua]                                 *--
--*                           [NVIM LAUNCH POINT]                            *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                               File Imports                                 --
--------------------------------------------------------------------------------
-- require('keyconfig')        -- NVIM keymaps congis
-- require('optconfig')        -- NVIM options configs
-- require('themeplugtable')   -- NVIM Lazy configs
-- require('themeplugconfig')  -- Installed theme and plugin configs

-- Options
-- =========================================
reload "options"

-- Autocommands
-- =========================================
reload "autocommands"

-- Additional Keybindings
-- =========================================
reload "keymaps"

-- Plugins Configuration
-- =========================================

reload "user.dap"
reload "user.modicator"
reload "user.nvimtree"
reload "user.lualine"
reload "user.modicator"
reload "user.lsp"
reload "user.smoothie"
-- reload "user.harpoon"
reload "user.webdev-icons"
reload "user.cybu"
reload "user.neotest"
reload "user.surround"
reload "user.bookmark"
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
reload "user.neoscroll"
reload "user.dotenv"
-- -- reload "user.tabnine"
-- -- reload "user.copilot"
-- -- reload "user.chatgpt"
-- reload "user.neoai"
reload "user.whichkey"
reload "user.cmp"
reload "nostr"
reload "user.astro-tools"
-- reload "user.matchup"
reload "user.betterescape"
reload "user.yanky"
reload "user.rest"
reload "user.metals"
-- reload "user.image"
-- reload "user.neorg"

-- Additional Plugins
-- =========================================
reload "plugins"

--================================-> END <-===================================--

--================================-> START <-=================================--
--                        BACKUP INFO - WHAT TO BACKUP                        --
--------------------------------------------------------------------------------
-- $HOME/.config/nvim
--     |
--     |-- init.lua (✓)
--     |
--     |-- lua ---------
--                     |------ keyconfig.lua (✓)
--                     |------ optconfig.lua (✓)
--                     |------ lazyconfig.lua (✓)
--                     |------ themeplugconfig.lua (✓)
--
--================================-> END <-===================================--


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
