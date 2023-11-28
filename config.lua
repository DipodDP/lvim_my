reload "user.dap"
reload "user.chatgpt"
reload "user.rest"
reload "user.metals"
reload "user.image"
reload "user.neorg"
reload "user.plugins"
reload "user.options"
reload "user.keymaps"
reload "user.lsp"
reload "user.smoothie"
reload "user.autocommands"
reload "user.webdev-icons"
reload "use.cybu"
reload "user.surround"
reload "user.neotest"
reload "user.todo-comments"
reload "user.jaq"
reload "user.fidget"
reload "user.git"
reload "user.zen-mode"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.bqf"
reload "user.dial"
reload "user.numb"
reload "user.treesitter"
reload "user.colorizer"
reload "user.lualine"
reload "user.tabnine"
reload "user.neoscroll"
reload "user.whichkey"
reload "user.cmp"
reload "user.nvimtree"
reload "nostr"
reload "user.astro-tools"
reload "user.matchup"
reload "user.dotenv"




vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
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
