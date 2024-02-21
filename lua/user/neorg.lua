local status, neorg = pcall(require, "neorg")
if not status then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          home = "~/neorg/",
          notes = "~/neorg/notes",
          books = "~/neorg/books",
          journal = "~/neorg/journal",
        },
        default_workspace = "home",
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.concealer"] = {},
  },
}
