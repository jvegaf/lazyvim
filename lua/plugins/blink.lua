return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'MahanRahmati/blink-nerdfont.nvim',
      {
        'mikavilpas/blink-ripgrep.nvim',
        version = '*', -- use the latest stable version
      },
      'alexandre-abrioux/blink-cmp-npm.nvim',
      'mgalliou/blink-cmp-tmux',
      'moyiz/blink-emoji.nvim',
    },
    opts = {
      completion = {
        menu = {
          border = 'rounded',
          -- direction_priority = { 'n', 's' },
          -- draw = {
          --   columns = {
          --     { 'label', 'label_description', gap = 1 },
          --     { 'kind_icon', 'kind' },
          --   },
          -- },
        },
      },
      sources = {
        default = {
          'ripgrep',
          'nerdfont',
          'emoji',
          'tmux',
          'npm',
        },
        providers = {
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = 15, -- Tune by preference
            opts = {
              insert = true, -- Insert emoji (default) or complete its name
              -- trigger = function()
              --   return { ':' }
              -- end,
              trigger = '::',
            },
            should_show_items = function()
              return vim.tbl_contains(
                -- Enable emoji completion only for git commits and markdown.
                -- By default, enabled for all file-types.
                { 'gitcommit', 'markdown' },
                vim.o.filetype
              )
            end,
          },
          tmux = {
            module = 'blink-cmp-tmux',
            name = 'tmux',
            -- default options
            opts = {
              -- `panes` option supports these values:
              -- * `window`  - completions from current tmux window panes only
              -- * `session` - completions from current tmux session panes only
              -- * `all`     - completions from all tmux panes
              panes = 'window',
              capture_history = false,
              -- only suggest completions from `tmux` if the `trigger_chars` are
              -- used
              triggered_only = false,
              trigger_chars = { '.' },
            },
          },
          nerdfont = {
            module = 'blink-nerdfont',
            name = 'Nerd Fonts',
            score_offset = 15, -- Tune by preference
            opts = {
              insert = true, -- Insert nerdfont icon (default) or complete its name
              trigger = ':nf', -- Customize the trigger. Defaults to ":"
            },
          },
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
            opts = {},
          },
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
}
