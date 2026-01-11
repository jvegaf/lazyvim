return {
  { 'nvim-neo-tree/neo-tree.nvim', enabled = false },
  {
    'folke/trouble.nvim',
    opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
  },
  -- Add symbols-outline.nvim plugin
  {
    -- Plugin: symbols-outline.nvim
    -- URL: https://github.com/simrat39/symbols-outline.nvim
    -- Description: A tree like view for symbols in Neovim using the Language Server Protocol.
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline', -- Command to open the symbols outline
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } }, -- Keybinding to open the symbols outline
    config = true, -- Use default configuration
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   opts = {
  --     model = 'claude-opus-4.5', -- AI model to use
  --     auto_insert_mode = true, -- Enter insert mode when opening
  --   },
  -- },
}
