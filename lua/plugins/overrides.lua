return {
  { 'nvim-neo-tree/neo-tree.nvim', enabled = false },
  {
    'folke/trouble.nvim',
    opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    opts = {
      model = 'claude-opus-4.5', -- AI model to use
      auto_insert_mode = true, -- Enter insert mode when opening
    },
  },
}
