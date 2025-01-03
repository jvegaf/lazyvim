return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    event = function()
      if vim.fn.exists("$TMUX") == 1 then
        return "VeryLazy"
      end
    end,
  },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})

      vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")
    end,
  },
  {
    "axieax/urlview.nvim",
    cmd = { "UrlView" },
    keys = {
      { "<leader>bu", "<cmd>UrlView buffer<cr>", desc = "urlview: buffers" },
      { "<leader>zu", "<cmd>UrlView lazy<cr>", desc = "urlview: lazy" },
      {
        "<leader>bU",
        "<cmd>UrlView buffer action=clipboard<cr>",
        desc = "urlview: copy links",
      },
    },
    opts = {
      default_title = "Links:",
      default_picker = "native",
      default_prefix = "https://",
      default_action = "system",
    },
  },
  {
    -- https://github.com/LunarVim/bigfile.nvim
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    },
    config = function(_, opts)
      require("bigfile").setup(opts)
    end,
  },
  -- Find And Replace
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = { headerMaxWidth = 80 },
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  -- Run :Pantran to translate the current line or visual selection. Then type 'g?' to see the available binding.
  {
    "potamides/pantran.nvim",
    event = "VeryLazy",
    cmd = { "Pantran" },
    config = function()
      local pantran = require("pantran")
      local opts = { noremap = true, silent = true, expr = true }
      vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
      vim.keymap.set("n", "<leader>trr", function()
        return pantran.motion_translate() .. "_"
      end, opts)
      vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)

      pantran.setup({
        default_engine = "google",
        default_target = "en",
      })
    end,
  },
  {
    "jvegaf/browse.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ff", "<cmd>VisualSearch<cr>", mode = "v", desc = "Search on web" },
      { "<leader>fb", "<cmd>VisualBookmarks<cr>", mode = "v", desc = "Search on web bookmarks" },
      { "<leader>fw", "<cmd>InputSearch<cr>", desc = "Search on web" },
    },
    config = function()
      -- code
      local bookmarks = {
        ["github"] = {
          ["name"] = "search github from neovim",
          ["code_search"] = "https://github.com/search?q=%s&type=code",
          ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
          ["issues_search"] = "https://github.com/search?q=%s&type=issues",
          ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
        },
        ["npm"] = "https://www.npmjs.com/search?q=%s",
        ["pipy"] = "https://pypi.org/search/?q=%s",
        ["stackoverflow"] = "https://stackoverflow.com/search?q=%s",
        ["youtube"] = "https://www.youtube.com/results?search_query=%s&page=&utm_source=opensearch",
        ["dotfyle"] = "https://dotfyle.com/neovim/plugins/trending?page=1&amp;q=%s",
      }

      local browse = require("browse")

      local function command(name, rhs, opts)
        opts = opts or {}
        vim.api.nvim_create_user_command(name, rhs, opts)
      end

      command("InputSearch", function()
        browse.input_search()
      end, {})

      command("VisualSearch", function(input)
        browse.input_search(input)
      end, {})

      -- this will open telescope using dropdown theme with all the available options
      -- in which `browse.nvim` can be used
      command("Browse", function()
        browse.browse({ bookmarks = bookmarks })
      end)

      command("Bookmarks", function()
        browse.open_bookmarks({ bookmarks = bookmarks })
      end)

      command("VisualBookmarks", function(input)
        browse.open_bookmarks({ bookmarks = bookmarks, visual_text = input })
      end)

      command("DevdocsSearch", function()
        browse.devdocs.search()
      end)

      command("DevdocsFiletypeSearch", function()
        browse.devdocs.search_with_filetype()
      end)

      command("MdnSearch", function()
        browse.mdn.search()
      end)
    end,
  },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    keys = {
      { "<M-1>", "<Cmd>1ToggleTerm direction=vertical size=80<Cr>", desc = "Terminal #1", mode = { "t", "n" } },
      { "<M-2>", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2", mode = { "t", "n" } },
      { "<M-3>", "<Cmd>3ToggleTerm direction=horizontal<Cr>", desc = "Terminal #3", mode = { "t", "n" } },
    },
    config = function()
      local is_win = vim.loop.os_uname().sysname == "Windows_NT"

      if is_win then
        local powershell_options = {
          shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
          shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
          shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
          shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
          shellquote = "",
          shellxquote = "",
        }

        for option, value in pairs(powershell_options) do
          vim.opt[option] = value
        end
      end

      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<A-0>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        winbar = {
          enabled = true,
        },
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },
}
