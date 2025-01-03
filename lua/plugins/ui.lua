return {
  {
    -- Automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        -- delay: delay in milliseconds
        delay = 100,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
          "dirvish",
          "fugitive",
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = 100,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
      })
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          {
            sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
            click = "v:lua.ScSa",
          },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          {
            sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
            click = "v:lua.ScSa",
          },
        },
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
    opts = {},
    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
  {
    "NvChad/ui",
    lazy = false,
    opts = {
      base46 = { theme = "onedark" },
      nvdash = {
        header = {
          -- " █████  ███████ ████████ ██████   ██████",
          -- "██   ██ ██         ██    ██   ██ ██    ██",
          -- "███████ ███████    ██    ██████  ██    ██",
          -- "██   ██      ██    ██    ██   ██ ██    ██",
          -- "██   ██ ███████    ██    ██   ██  ██████",
          -- " ",
          "    ███    ██ ██    ██ ██ ███    ███",
          "    ████   ██ ██    ██ ██ ████  ████",
          "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
          "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
          "    ██   ████   ████   ██ ██      ██",
          "",
          "",
          "",
        },

        buttons = {
          { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
          { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
          { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
          { txt = "󱥚  Themes", keys = "Spc f t", cmd = ":lua require('nvchad.themes').open()" },
          { txt = "  Last Session", keys = "Spc S l", cmd = "NvCheatsheet" },

          { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

          {
            txt = function()
              local stats = require("lazy").stats()
              local ms = math.floor(stats.startuptime) .. " ms"
              return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashLazy",
            no_gap = true,
          },

          { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
        },
      },
    },
    init = function()
      -- load the lazy opts on module load
      package.preload["chadrc"] = function()
        local plugin = require("lazy.core.config").spec.plugins["ui"]
        return require("lazy.core.plugin").values(plugin, "opts", false)
      end
    end,
    config = function()
      pcall(function()
        dofile(vim.g.base46_cache .. "defaults")
        dofile(vim.g.base46_cache .. "statusline")
      end)
      require("nvchad")
    end,
    specs = {
      {
        "hrsh7th/nvim-cmp",
        optional = true,
        opts = function(_, opts)
          return vim.tbl_deep_extend("force", opts, require("nvchad.cmp"))
        end,
      },
      -- {
      --   "AstroNvim/astrocore",
      --   opts = {
      --     options = { opt = { showtabline = 0 } },
      --     autocmds = { bufferline = false },
      --     mappings = {
      --       n = {
      --         ["<Leader>h"] = {
      --           function()
      --             local is_valid_win = function(win)
      --               local bufnr = vim.api.nvim_win_get_buf(win)
      --               return require("astrocore.buffer").is_valid(bufnr) or vim.bo[bufnr].filetype == "alpha"
      --             end
      --             local cur_win = vim.api.nvim_get_current_win()
      --             -- try to find the most suitable window for Alpha
      --             if not is_valid_win(cur_win) then
      --               for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      --                 if win ~= cur_win and is_valid_win(win) then
      --                   vim.fn.win_gotoid(win)
      --                   break
      --                 end
      --               end
      --             end
      --             require("nvchad.nvdash").open()
      --           end,
      --           desc = "Home Screen",
      --         },
      --         ["<Leader>ft"] = {
      --           function()
      --             require("nvchad.themes").open()
      --           end,
      --           desc = "Find themes",
      --         },
      --       },
      --     },
      --   },
      -- },
      -- Disable unnecessary plugins
      -- { import = "astrocommunity.recipes.disable-tabline" },
      { "rebelot/heirline.nvim", opts = { statusline = false } },
      { "goolord/alpha-nvim", enabled = false },
      { "brenoprata10/nvim-highlight-colors", enabled = false },
      { "NvChad/nvim-colorizer.lua", enabled = false },
      -- add lazy loaded dependencies
      { "nvim-lua/plenary.nvim", lazy = true },
      { "NvChad/volt", lazy = true },
      {
        "NvChad/base46",
        lazy = true,
        init = function()
          vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
        end,
        build = function()
          vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
          require("base46").load_all_highlights()
        end,
        -- load base46 cache when necessary
        specs = {
          {
            "nvim-treesitter/nvim-treesitter",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "syntax")
                dofile(vim.g.base46_cache .. "treesitter")
              end)
            end,
          },
          {
            "folke/which-key.nvim",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "whichkey")
              end)
            end,
          },
          {
            "lukas-reineke/indent-blankline.nvim",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "blankline")
              end)
            end,
          },
          {
            "nvim-telescope/telescope.nvim",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "telescope")
              end)
            end,
          },
          {
            "neovim/nvim-lspconfig",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "lsp")
              end)
            end,
          },
          {
            "nvim-tree/nvim-tree.lua",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "nvimtree")
              end)
            end,
          },
          {
            "williamboman/mason.nvim",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "mason")
              end)
            end,
          },
          {
            "lewis6991/gitsigns.nvim",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "git")
              end)
            end,
          },
          {
            "nvim-tree/nvim-web-devicons",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "devicons")
              end)
            end,
          },
          {
            "echasnovski/mini.icons",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "devicons")
              end)
            end,
          },
          {
            "hrsh7th/nvim-cmp",
            -- optional = true,
            opts = function()
              pcall(function()
                dofile(vim.g.base46_cache .. "cmp")
              end)
            end,
          },
        },
      },
    },
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    config = function()
      require("ayu").setup({})
    end,
  },
}
