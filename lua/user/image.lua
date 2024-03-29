-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"

-- default config
require("image").setup {
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      sizing_strategy = "auto",
      download_remote_images = true,
      clear_in_insert_mode = false,
      only_render_image_at_cursor = false,
    },
    neorg = {
      enabled = true,
      download_remote_images = true,
      clear_in_insert_mode = true,
      only_render_image_at_cursor = true,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  kitty_method = "normal",
  kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
}
