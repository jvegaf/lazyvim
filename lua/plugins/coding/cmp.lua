return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-emoji',
    'jdrupal-dev/css-vars.nvim',
    'SergioRibera/cmp-dotenv',
    'davidmh/cmp-nerdfonts',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-nvim-lua',
    'lukas-reineke/cmp-rg',
    'onsails/lspkind-nvim',
  },
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = 'emoji' },
      { name = 'css_vars' },
      { name = 'rs' },
      { name = 'path' },
      { name = 'nerdfonts' },
      { name = 'cmdline' },
      { name = 'dotenv' },
    }))
  end,
}
