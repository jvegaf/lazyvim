return {
  -- Plugin: nvim-lspconfig
  -- URL: https://github.com/neovim/nvim-lspconfig
  -- Description: Quickstart configurations for the Neovim LSP client.
  'neovim/nvim-lspconfig',
  event = 'VeryLazy', -- Load this plugin on the 'VeryLazy' event
  opts = {
    inlay_hints = { enabled = false }, -- Disable inlay hints
    servers = {
      angularls = {
        -- Configuration for Angular Language Server
        root_dir = function(fname)
          return require('lspconfig.util').root_pattern('angular.json', 'project.json')(fname)
        end,
      },
      nil_ls = {
        -- Configuration for nil (Nix Language Server), already installed via nix
        cmd = { 'nil' },
        autostart = true,
        mason = false, -- Explicitly disable mason management for nil_ls
        settings = {
          ['nil'] = {
            formatting = { command = { 'nixpkgs-fmt' } },
          },
        },
      },
      arduino_language_server = {
        -- Configuration for Arduino Language Server
        cmd = {
          'arduino-language-server',
          '-cli',
          'arduino-cli',
          '-fqbn',
          'arduino:avr:uno',
          '-clangd',
          'clangd',
        },
        filetypes = { 'ino', 'pde', 'cpp' },
        root_dir = require('lspconfig.util').root_pattern('*.ino', '*.pde', '.git', '*.ini'),
      },
      clangd = {
        -- Configuration for clangd
        cmd = {
          'clangd',
          '--background-index',
          '--cross-file-rename',
          '--completion-style=detailed',
          '--header-insertion=never',
        },
        capabilities = {
          offsetEncoding = { 'utf-16' }, -- Set offset encoding to utf-16 for clangd
        },
      },
      docker_compose_language_service = {},
    },
  },
}
