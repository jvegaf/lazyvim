return {
  {
    'zbirenbaum/copilot.lua',
    lazy = false,
    priority = 1000,
    config = function()
      require('copilot').setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-y>',
          },
        },
      })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    config = function()
      require('CopilotChat').setup({
        model = 'claude-sonnet-4',
        highlight_headers = false,
        prompts = {
          GoodPractices = {
            prompt = 'Apply good practices',
            system_prompt = 'Refactor the following code to improve its clarity and readability, while maintaining its functionality. Remove any switch case in favor of object literal access, use nested ternaries, use implicit arrow return if needed. Be sure to include comments explaining the changes you made.',
            description = 'Refactor the code to apply good practices',
          },
        },
      })
    end,
    opts = {},
    cmd = {
      'CopilotChat',
      'CopilotChatOpen',
      'CopilotChatToggle',
      'CopilotChatLoad',
      'CopilotChatPrompts',
      'CopilotChatModels',
      'CopilotChatAgents',
      'CopilotChatReview',
      'CopilotChatFix',
      'CopilotChatOptimize',
      'CopilotChatDocs',
      'CopilotChatTests',
      'CopilotChatCommit',
    },
  },
}
