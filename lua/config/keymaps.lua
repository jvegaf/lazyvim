local map = vim.keymap
local NS = { noremap = true, silent = true }

-- General keymaps
map.set('i', 'jk', '<ESC>', NS) -- exit insert mode with jk
map.set('i', 'jj', '<ESC>', NS) -- exit insert mode with jk
map.set('n', 'Q', ':q<CR>', NS) -- quit without saving
map.set('n', 'W', ':w<CR>', NS) -- save

-- Buffers
map.set('n', 'H', ':BufferLineCyclePrev<cr>', NS)
map.set('n', 'L', ':BufferLineCycleNext<cr>', NS)
map.set('n', 'q', ':bdelete<CR>', NS) -- close buffer
map.set('n', '<leader>bb', ':e #<cr>', NS)

-- Tab management
map.set('n', '<localleader>to', ':tabnew<CR>') -- open a new tab
map.set('n', '<localleader>tx', ':tabclose<CR>') -- close a tab
map.set('n', '<localleader>tn', ':tabn<CR>') -- next tab
map.set('n', '<localleader>tp', ':tabp<CR>') -- previous tab
map.set('n', '<localleader>,', ':tabNext<CR>')

-- Quickfix keymaps
map.set('n', '<localleader>qo', ':copen<CR>') -- open quickfix list
map.set('n', '<localleader>qf', ':cfirst<CR>') -- jump to first quickfix list item
map.set('n', '<localleader>qn', ':cnext<CR>') -- jump to next quickfix list item
map.set('n', '<localleader>qp', ':cprev<CR>') -- jump to prev quickfix list item
map.set('n', '<localleader>ql', ':clast<CR>') -- jump to last quickfix list item
map.set('n', '<localleader>qc', ':cclose<CR>') -- close quickfix list

-- LSP keymaps
-- rename symbol
map.set('n', '<localleader>rl', '<cmd>lua vim.lsp.buf.rename()<CR>', NS)

--diagnotic keymaps
map.set('n', 'gk', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Previous Diagnostic' })
map.set('n', 'gj', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Next Diagnostic' })
-- map.set("n", "<leader>xx", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Buffer diagnostics" })
-- map.set("n", "<leader>xX", function() builtin.diagnostics({ root_dir = true }) end, { desc = "cwd diagnostics" })
-- map.set("n", "<localleader>xx", vim.lsp.code_action, { desc = "Code Action" })
-- map.set("n", "<localleader>xX", LazyVim.lsp.action.source, { desc = "Source Action" })

-- dont yank on visual paste
map.set('v', 'p', '"_dP', NS)

-- Cancel search highlighting with ESC
map.set('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>', NS)

-- Select all
-- map.set('n', '<C-a>', 'gg<S-v>G', NS)

map.set('n', 'vv', 'V', NS)

map.set('v', '<', '<gv', { desc = 'Stay in indent mode' })
map.set('v', '>', '>gv', { desc = 'Stay in indent mode' })

-- Jumplist
map.set('n', '<C-m>', '<C-i>', NS)

-- Copilot Chat
-- map.set("n", "<leader>am", ":CopilotChatCommit<cr>", NS)

-- Treesj
map.set('n', '<leader>j', function()
  require('treesj').toggle({ split = { recusive = true } })
end, { noremap = true, silent = true, desc = 'Toggle Split Join' })

-- System
map.set('n', '<leader>zs', ':e $MYVIMRC<cr>', { noremap = true, silent = true, desc = 'Config' })
-- map.set("n", "<leader>zn", ":NoiceHistory<cr>", { noremap = true, silent = true, desc = "Notifications" })
map.set('n', '<leader>zh', ':checkhealth<cr>', { noremap = true, silent = true, desc = 'Health' })
map.set('n', '<leader>zm', ':Mason<cr>', { noremap = true, silent = true, desc = 'Mason' })
map.set('n', '<leader>zl', ':Lazy<cr>', { noremap = true, silent = true, desc = 'Lazy' })
map.set('n', '<leader>za', ':messages<cr>', { desc = 'Messages' })

map.set('n', '<leader>uc', function()
  require('nvchad.themes').open()
end, { noremap = true, silent = true, desc = 'ColorSchemes' })
-- FileBrowser
-- map.set("n", "<leader>e",":Nv<CR>", NS) -- toggle file explorer
-- map.set("n", "<leader>e",":NvimTreeFocus<CR>", NS) -- toggle file explorer
-- map.set("n", "<leader>e", function() Snacks.explorer() end, NS) -- toggle file explorer
-- map.set("n", "<localleader>E", ":Telescope file_browser<CR>", NS) -- toggle focus to file explorer

map.set('n', 'gq', '<leader>cf', NS)
