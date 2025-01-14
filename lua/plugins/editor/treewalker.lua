return {
  'aaronik/treewalker.nvim',
  opts = {
    highlight = true,
    highlight_duration = 250,
    highlight_group = 'CursorLine',
  },
  keys = {
    { 'n', '<localleader>d', '<cmd>Treewalker Down<CR>' },
    { 'n', '<localleader>s', '<cmd>Treewalker Up<CR>' },
  },
}
