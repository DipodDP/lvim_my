-- Additional Plugins

lvim.plugins = {
  "rebelot/kanagawa.nvim",
  "ellisonleao/gruvbox.nvim",
  {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
  },
  {
    'dccsillag/magma-nvim',
    build = ':UpdateRemotePlugins'
  },
  "metakirby5/codi.vim",
  "jackMort/ChatGPT.nvim",
  "onsails/lspkind.nvim",
  {
    url = "https://gitlab.com/itaranto/plantuml.nvim",
    version = "*",
    config = function()
      require("plantuml").setup {
        renderer = {
          type = "image",
          options = {
            prog = "feh",
            dark_mode = true,
          },
        },
        render_on_write = true,
      }
    end,
  },
  {
    "3rd/image.nvim",
    rocks = { "magick" },
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        auto_open = false,
        auto_close = true,
        padding = false,
        height = 10,
        use_diagnostic_signs = true,
      }
    end,
    event = "VeryLazy",
    cmd = "Trouble",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers", -- This is the important bit!
  },
  {
    "ellisonleao/dotenv.nvim",
    config = function()
      require("dotenv").setup()
    end,
  },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   event = "InsertEnter",
  --   init = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       desc = "dadbod completion",
  --       group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
  --       pattern = { "sql", "mysql", "plsql" },
  --       callback = function()
  --         require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
  --       end,
  --     })
  --   end,
  -- },
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  "rest-nvim/rest.nvim",
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  "folke/tokyonight.nvim",
  {
    "mawkler/modicator.nvim",
    event = "ColorScheme",
    dependencies = { url = "git@github.com:LunarVim/primer.nvim.git" }, -- Add your colorscheme plugin here
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      show_warnings = false,
      highlights = {
        -- Default options for bold/italic
        defaults = {
          bold = true,
          italic = false,
        },
      },
      integration = {
        lualine = {
          enabled = true,
          -- Letter of lualine section to use (if `nil`, gets detected automatically)
          mode_section = nil,
          -- Whether to use lualine's mode highlight's foreground or background
          highlight = 'bg',
        },
      },
    },
  },
  "HiPhish/nvim-ts-rainbow2",
  "stevearc/dressing.nvim",
  -- "AckslD/swenv.nvim",
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- "mfussenegger/nvim-jdtls",
  "opalmay/vim-smoothie",
  "j-hui/fidget.nvim",
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "tsx", "typescriptreact" },
      })
    end,
  },
  "kylechui/nvim-surround",
  -- "christianchiarulli/harpoon",
  -- "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  -- "moll/vim-bbye",
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
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "nacro90/numb.nvim",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  -- "MunifTanjim/nui.nvim",
  -- "jackMort/ChatGPT.nvim",
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  -- { "christianchiarulli/telescope-tabs", branch = "chris" },
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

  -- "MunifTanjim/nui.nvim",
  -- "Bryley/neoai.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "andy-bell101/neotest-java",
  "nvim-neotest/neotest-go",
  "nvim-neotest/neotest-python",
  "rouge8/neotest-rust",
  "haydenmeade/neotest-jest",
  {
    "hrsh7th/cmp-emoji",
    event = "BufRead",
  },
  "ThePrimeagen/vim-be-good",
  -- "folke/noice.nvim",
  -- "rcarriga/nvim-notify",

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  "rmagatti/auto-session",
  "rmagatti/session-lens",
  -- "christianchiarulli/nvim-ts-rainbow",
  -- "karb94/neoscroll.nvim",
  {
    "max397574/better-escape.nvim",
    event = "BufRead",
  },
  {
    "ojroques/nvim-osc52",
    event = "BufRead",
  },
  {
    "gbprod/yanky.nvim",
    event = "BufRead",
  },
}
