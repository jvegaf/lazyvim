return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --     "hrsh7th/cmp-buffer",
  --     "SergioRibera/cmp-dotenv",
  --     "davidmh/cmp-nerdfonts",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lsp-signature-help",
  --     "hrsh7th/cmp-nvim-lsp-document-symbol",
  --     "hrsh7th/cmp-nvim-lua",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-git",
  --     "lukas-reineke/cmp-rg",
  --     "onsails/lspkind-nvim",
  --     "rafamadriz/friendly-snippets",
  --     "saadparwaiz1/cmp_luasnip",
  --     {
  --       "L3MON4D3/LuaSnip",
  --       version = "v2.*",
  --       build = "make install_jsregexp",
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, {
  --       {
  --         name = "emoji",
  --       },
  --       {
  --         name = "rg",
  --       },
  --       {
  --         name = "path",
  --       },
  --       {
  --         name = "nvim_lsp",
  --       },
  --       {
  --         name = "nerdfonts",
  --       },
  --       {
  --         name = "nvim_lua",
  --       },
  --       {
  --         name = "cmdline",
  --       },
  --       {
  --         name = "dotenv",
  --       },
  --     })
  --   end,
  -- },
}
