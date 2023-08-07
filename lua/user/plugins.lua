-- Additional Plugins

lvim.plugins = {
-- Lua
{
  '0x00-ketsu/markdown-preview.nvim',
  ft = {'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki'},
  config = function()
    require('markdown-preview').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the setup section below
    }
  end
},
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
  },
  "tpope/vim-dotenv",
  {
    "kristijanhusak/vim-dadbod-completion",
    event = "InsertEnter",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "dadbod completion",
        group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
        end,
      })
    end,
  },
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      }
    end,
  },
  -- {
  --   "whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  "renerocksai/telekasten.nvim",
  "folke/tokyonight.nvim",
  {
    "mawkler/modicator.nvim",
    event = "ColorScheme",
  },
  "HiPhish/nvim-ts-rainbow2",
  -- {
  --   dir = "/Users/chris/Repos/bookmark.nvim",
  -- },
  "andymass/vim-matchup",
  "lunarvim/synthwave84.nvim",
  {
    "kndndrj/nvim-dbee",
    build = function()
      require("dbee").install()
    end,
  },
  "kkharji/sqlite.lua",
  { url = "git@github.com:ChristianChiarulli/bookmark.nvim.git" },
  { url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
  { url = "git@github.com:LunarVim/primer.nvim.git" },
  -- { "christianchiarulli/tabnine-nvim", build = "./dl_binaries.sh", branch = "suggestion_hl_group" },
  "stevearc/dressing.nvim",
  "AckslD/swenv.nvim",
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "mfussenegger/nvim-jdtls",
  "opalmay/vim-smoothie",
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
  },
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "christianchiarulli/harpoon",
  -- "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
  },
  "lunarvim/darkplus.nvim",
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "nacro90/numb.nvim",
  "neogitorg/neogit",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  -- "renerocksai/calendar-vim",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  "MunifTanjim/nui.nvim",
  "jackMort/ChatGPT.nvim",
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- {
  --   "tzachar/cmp-tabnine",
  --   event = "BufRead",
  --   build = "./install.sh",
  -- },

  "MunifTanjim/nui.nvim",
  "Bryley/neoai.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  -- "andy-bell101/neotest-java",
  "nvim-neotest/neotest-python",
  {
    "hrsh7th/cmp-emoji",
    event = "BufRead",
  },
  "ThePrimeagen/vim-be-good",
  -- "folke/noice.nvim",
  -- "rcarriga/nvim-notify",

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
  -- "christianchiarulli/nvim-ts-rainbow",
  -- "karb94/neoscroll.nvim",
}
