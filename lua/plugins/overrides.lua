return {
  -- { 'nvim-neo-tree/neo-tree.nvim', enabled = false },
  {
    'folke/trouble.nvim',
    opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    opts = {
      model = 'claude-sonnet-4.5', -- AI model to use
      auto_insert_mode = false, -- Enter insert mode when opening
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
