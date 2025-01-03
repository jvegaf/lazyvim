return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      cursor_behavior = "start",
      max_join_length = 200,
    },
  },
  {
    "cappyzawa/trim.nvim",
    event = "BufWrite",
    opts = {
      trim_on_write = true,
      trim_trailing = true,
      trim_last_line = false,
      trim_first_line = false,
      -- ft_blocklist = { "markdown", "text", "org", "tex", "asciidoc", "rst" },
      -- patterns = {[[%s/\(\n\n\)\n\+/\1/]]}, -- Only one consecutive bl
    },
    {
      "mg979/vim-visual-multi",
      keys = {
        "<C-n>",
        "<C-Up>",
        "<C-Down>",
        "<S-Up>",
        "<S-Down>",
        "<S-Left>",
        "<S-Right>",
      },
      config = function()
        vim.g.VM_leader = ";"
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        event_handlers = {

          {
            event = "file_open_requested",
            handler = function()
              -- auto close
              -- vim.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      },
    },
  },
  {
    "junegunn/vim-easy-align",
    event = "BufReadPre",
    keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" } },
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>cu", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "debugloop/telescope-undo.nvim",
  --   },
  --   config = function()
  --     require("telescope").setup({
  --       extensions = {
  --         undo = {
  --           -- telescope-undo.nvim config, see below
  --         },
  --       },
  --     })
  --     require("telescope").load_extension("undo")
  --     -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  --   end,
  --   keys = {
  --     { "<leader>cu", "<cmd>Telescope undo<cr>", desc = "Undotree" },
  --   },
  -- },
  {
    "pechorin/any-jump.vim",
    cmd = { "AnyJump", "AnyJumpVisual" },
    keys = {
      { "<leader>ii", "<cmd>AnyJump<CR>", desc = "Any Jump" },
      { "<leader>ii", "<cmd>AnyJumpVisual<CR>", mode = "x", desc = "Any Jump" },
      { "<leader>ib", "<cmd>AnyJumpBack<CR>", desc = "Any Jump Back" },
      { "<leader>il", "<cmd>AnyJumpLastResults<CR>", desc = "Any Jump Resume" },
    },
    init = function()
      vim.g.any_jump_disable_default_keybindings = 1
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("rafi_any-jump", {}),
        pattern = "any-jump",
        callback = function()
          vim.opt.cursorline = true
        end,
      })
    end,
  },
}
