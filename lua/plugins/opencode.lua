-- stylua: ignore

return {
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
      { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
    },
    config = function()
      -- Your configuration, if any — see `lua/opencode/config.lua`
        vim.g.opencode_opts = {
          provider = {
              enabled = "tmux",
            }
        }

        vim.api.nvim_create_autocmd("User", {
          pattern = "OpencodeEvent:*", -- Optionally filter event types
          callback = function(args)
            ---@type opencode.cli.client.Event
            local event = args.data.event
            ---@type number
            local port = args.data.port

            -- See the available event types and their properties
            vim.notify(vim.inspect(event))
            -- Do something useful
            if event.type == "session.idle" then
              vim.notify("`opencode` finished responding")
            end
          end,
        })

        -- Required for `vim.g.opencode_opts.auto_reload`
        vim.opt.autoread = true

        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<leader>oo", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask about this" })
        vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").prompt("@this") end, { desc = "Add this" })
        vim.keymap.set({ "n", "x" }, "<leader>op", function() require("opencode").select() end, { desc = "Select prompt" })
        vim.keymap.set("n",           "<leader>op", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
        vim.keymap.set("n",           "<leader>oe", function() require('opencode').prompt('Explain @cursor and its context') end, { desc = "Explain code near cursor" })
        vim.keymap.set("n",           "<leader>oc", function() require("opencode").command("session.list") end, { desc = "Select session" })
        vim.keymap.set("n",           "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
        vim.keymap.set("n",           "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Interrupt session" })
        vim.keymap.set("n",           "<leader>oA", function() require("opencode").command("agent_cycle") end, { desc = "Cycle selected agent" })
        vim.keymap.set("n",           "<S-C-u>",    function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
        vim.keymap.set("n",           "<S-C-d>",    function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    opts = function(_, opts)
        table.insert(opts.sections.lualine_c, {
        require("opencode").statusline,
        })
      end,
  },
}
