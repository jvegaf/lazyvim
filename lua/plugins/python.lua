return {
  {
    enabled = false,
    event = 'VeryLazy',
    'jim-at-jibba/micropython.nvim',
    dependencies = { 'akinsho/toggleterm.nvim', 'stevearc/dressing.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>mr', require('micropython_nvim').run)
    end,
  },
  {
    'stevanmilic/nvim-lspimport',
    ft = { 'python' },
    event = 'VeryLazy',
    keys = { { '<leader>I', "<cmd>lua require('lspimport').import()<cr>" } },
  },
  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  --   ft = { "python" },
  --   branch = "regexp",
  --   config = function()
  --     require("venv-selector").setup {
  --       -- Your options go here
  --       -- name = "venv",
  --       -- auto_refresh = false
  --     }
  --   end,
  --   event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  --   keys = {
  --     -- Keymap to open VenvSelector to pick a venv.
  --     { "<leader>vs", "<cmd>VenvSelect<cr>" },
  --     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
  --     { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  --   },
  -- },
  {
    'roobert/f-string-toggle.nvim',
    event = 'VeryLazy',
    opts = {
      key_binding = '<localleader>f',
      key_binding_desc = 'Toggle f-string',
    },
  },
  {
    'neolooong/whichpy.nvim',
    ft = { 'python' },
    opts = {},
  },
  {
    'SWiegandt/autoself.nvim',
    ft = { 'python' },
    config = true,
  },
  {
    'alexpasmantier/pymple.nvim',
    -- ft = { "python" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      -- optional (nicer ui)
      'stevearc/dressing.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    build = ':PympleBuild',
    config = function()
      require('pymple').setup({})
    end,
  },
  {
    -- dir = "~/nvim-python-repl",
    'geg2102/nvim-python-repl',
    event = 'InsertEnter', -- You might want to adjust this event for better plugin loading timing
    config = function()
      -- Setup the REPL plugin
      require('nvim-python-repl').setup({ vsplit = true })
    end,
    branch = 'main',
    -- Define key mappings
    vim.api.nvim_set_keymap(
      'n',
      '<leader>n',
      "<cmd>lua require('nvim-python-repl').send_statement_definition()<CR>",
      { noremap = true, silent = true, desc = 'Send semantic unit to REPL' }
    ),
    vim.api.nvim_set_keymap(
      'v',
      '<leader>n',
      "<cmd>lua require('nvim-python-repl').send_visual_to_repl()<CR>",
      { noremap = true, silent = true, desc = 'Send visual selection to REPL' }
    ),
    vim.api.nvim_set_keymap(
      'n',
      '<leader>N',
      "<cmd>lua require('nvim-python-repl').send_current_cell_to_repl()<CR>",
      { noremap = true, silent = true, desc = 'Send visual selection to REPL' }
    ),
    vim.api.nvim_set_keymap(
      'n',
      '<leader>nr',
      "<cmd>lua require('nvim-python-repl').send_buffer_to_repl()<CR>",
      { noremap = true, silent = true, desc = 'Send entire buffer to REPL' }
    ),
    vim.api.nvim_set_keymap(
      'n',
      '<leader>e',
      "<cmd>lua require('nvim-python-repl').toggle_execute()<CR>",
      { noremap = true, silent = true, desc = 'Automatically execute command in REPL after sent' }
    ),
    vim.api.nvim_set_keymap(
      'n',
      '<leader>jn',
      "<cmd>lua require('nvim-python-repl').send_current_cell_to_repl()<CR>",
      { noremap = true, silent = true, desc = 'Send cell to REPL' }
    ),
  },
  {
    -- enabled = false,
    'AckslD/swenv.nvim',
    ft = 'python',
    config = function()
      require('swenv').setup({
        post_set_env = function()
          vim.cmd('LspRestart')
        end,
      })

      local map = vim.keymap.set
      local api = require('swenv.api')

      map('n', '<leader>ps', function()
        api.pick_venv()
      end, { desc = 'Choose Python venv' })
      map('n', '<leader>pe', function()
        api.get_current_venv()
      end, { desc = 'Show current Python venv' })
    end,
  },
}
