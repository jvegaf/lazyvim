local prompts = {
  Explain = 'Please explain how the following code works.', -- Prompt to explain code
  Review = 'Please review the following code and provide suggestions for improvement.', -- Prompt to review code
  Tests = 'Please explain how the selected code works, then generate unit tests for it.', -- Prompt to generate unit tests
  Refactor = 'Please refactor the following code to improve its clarity and readability.', -- Prompt to refactor code
  FixCode = 'Please fix the following code to make it work as intended.', -- Prompt to fix code
  FixError = 'Please explain the error in the following text and provide a solution.', -- Prompt to fix errors
  BetterNamings = 'Please provide better names for the following variables and functions.', -- Prompt to suggest better names
  Documentation = 'Please provide documentation for the following code.', -- Prompt to generate documentation
  JsDocs = 'Please provide JsDocs for the following code.', -- Prompt to generate JsDocs
  DocumentationForGithub = 'Please provide documentation for the following code ready for GitHub using markdown.', -- Prompt to generate GitHub documentation
  CreateAPost = 'Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.', -- Prompt to create a social media post
  SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.', -- Prompt to generate Swagger API docs
  SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.', -- Prompt to generate Swagger JsDocs
  Summarize = 'Please summarize the following text.', -- Prompt to summarize text
  Spelling = 'Please correct any grammar and spelling errors in the following text.', -- Prompt to correct spelling and grammar
  Wording = 'Please improve the grammar and wording of the following text.', -- Prompt to improve wording
  Concise = 'Please rewrite the following text to make it more concise.', -- Prompt to make text concise
  Commit = 'Please generate a commit message with stagging changes',
}

return {
  { 'nvim-neo-tree/neo-tree.nvim', enabled = false },
  { 'stevearc/dressing.nvim', enabled = false },
  {
    'folke/trouble.nvim',
    opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   opts = {
  --     model = 'claude-sonnet-4.5', -- AI model to use
  --     auto_insert_mode = false, -- Enter insert mode when opening
  --     prompts = prompts, -- Custom prompts
  --   },
  -- },
  {
    'folke/sidekick.nvim',
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
  },
  {
    'folke/snacks.nvim',
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { ui_select = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
    },
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      'MahanRahmati/blink-nerdfont.nvim',
      -- {
      --   'mikavilpas/blink-ripgrep.nvim',
      --   version = '*', -- use the latest stable version
      -- },
      -- 'moyiz/blink-emoji.nvim',
      -- 'mgalliou/blink-cmp-tmux',
      'alexandre-abrioux/blink-cmp-npm.nvim',
    },
    opts = {
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      sources = {
        default = {
          'nerdfont',
          -- 'ripgrep', -- 👈🏻 add "ripgrep" here
          -- 'emoji', -- 👈🏻 add "emoji" here
          -- 'tmux',
          'npm',
        },
        providers = {
          nerdfont = {
            module = 'blink-nerdfont',
            name = 'Nerd Fonts',
            score_offset = 15, -- Tune by preference
            opts = {
              insert = true, -- Insert nerdfont icon (default) or complete its name
              trigger = ':-)', -- Customize the trigger. Defaults to ":"
            },
          },
          -- ripgrep = {
          --   module = 'blink-ripgrep',
          --   name = 'Ripgrep',
          --   opts = {},
          -- },
          -- emoji = {
          --   module = 'blink-emoji',
          --   name = 'Emoji',
          --   score_offset = 15, -- Tune by preference
          --   opts = {
          --     insert = true, -- Insert emoji (default) or complete its name
          --     ---@type string|table|fun():table
          --     trigger = function()
          --       return { ':' }
          --     end,
          --   },
          --   should_show_items = function()
          --     return vim.tbl_contains(
          --       -- Enable emoji completion only for git commits and markdown.
          --       -- By default, enabled for all file-types.
          --       { 'gitcommit', 'markdown' },
          --       vim.o.filetype
          --     )
          --   end,
          -- },
          -- tmux = {
          --   module = 'blink-cmp-tmux',
          --   name = 'tmux',
          --   -- default options
          --   opts = {
          --     -- `panes` option supports these values:
          --     -- * `window`  - completions from current tmux window panes only
          --     -- * `session` - completions from current tmux session panes only
          --     -- * `all`     - completions from all tmux panes
          --     panes = 'window',
          --     capture_history = false,
          --     -- only suggest completions from `tmux` if the `trigger_chars` are
          --     -- used
          --     triggered_only = false,
          --     trigger_chars = { '.' },
          --   },
          -- },
          npm = {
            name = 'npm',
            module = 'blink-cmp-npm',
            async = true,
            -- optional - make blink-cmp-npm completions top priority (see `:h blink.cmp`)
            score_offset = 100,
            -- optional - blink-cmp-npm config
            opts = {
              ignore = {},
              only_semantic_versions = true,
              only_latest_version = false,
            },
          },
        },
      },
    },
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   build = 'cd app && npm install',
  --   init = function()
  --     vim.g.mkdp_filetypes = { 'markdown' }
  --   end,
  --   ft = { 'markdown' },
  -- },
}
