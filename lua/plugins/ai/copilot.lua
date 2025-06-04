return {
  'zbirenbaum/copilot.lua',
  lazy = false,
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = function(_, opts)
    require('copilot').setup(opts)
    require('copilot.api').status = require('copilot.status')
    require('copilot.api').filetypes = {
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
    }
  end,
}
