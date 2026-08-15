-- Migrated to snacks pickers in lua/plugins/git.lua (2026-08):
--   <leader>gb -> Snacks.picker.git_branches()
--   <leader>gz -> Snacks.picker.git_log() (commit diffs via live preview)
-- Kept here for reference/recovery. Note: diffview.nvim is disabled in
-- git.lua, so the diff_commits flow (DiffviewOpen <commit>^!) never worked.
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'paopaol/telescope-git-diffs.nvim',
  },
  config = function()
    require('telescope').load_extension('git_diffs')
  end,
  keys = {
    { '<leader>gz', '<cmd>Telescope git_diffs  diff_commits<CR>', desc = 'Telescope diff_commits' },
    { '<leader>gb', '<cmd>Telescope git_branches <CR>', desc = 'Branches' },
  },
}
