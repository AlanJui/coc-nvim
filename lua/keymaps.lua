-- keymap.lua
local keymap = require('utils.set_keymap')
local opts = { silent = true, noremap = true }

vim.g.maplocalleader = ','

keymap('i', 'jj', '<Esc>', opts)
keymap('i', '<LocalLeader>O', '<Esc>O',   opts)
keymap('i', '<LocalLeader>o', '<Esc>jO',  opts)
keymap('i', '<LocalLeader>G', '<Esc>Go',  opts)
keymap('i', '<LocalLeader>l', '<Esc>la',  opts)
keymap('i', '<LocalLeader>a', '<Esc>A',   opts)
keymap('i', '<LocalLeader>,', '<Esc>la,', opts)
keymap('i', '<LocalLeader>:', '<Esc>la:', opts)

keymap('n', 'H', '0', opts)
keymap('n', 'L', '$', opts)
keymap('n', 'X', 'd$', opts)
keymap('n', 'Y', 'y$', opts)

-- keymap('n', '\\', ':Explore<CR>', opts)
keymap('n', '\\', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
keymap('n', '<LocalLeader>f', ':Telescope<CR>', opts)

-- Move line
keymap('n', '<S-Down>', ':m .+1<CR>', opts)
keymap('n', '<S-Up>',   ':m .-2<CR>', opts)
keymap('i', '<S-Down>', '<Esc>:m .+1<CR>', opts)
keymap('i', '<S-Up>',   '<Esc>:m .-2<CR>', opts)
keymap('v', '<S-Down>', ":move '>+1<CR>gv-gv", opts)
keymap('v', '<S-Up>',   ":move '<-2<CR>gv-gv", opts)

-- Comment
keymap('n', '<C-_>', ':CommentToggle<CR>', opts)
keymap('v', '<C-_>', ":'<,'>CommentToggle<CR>", opts)

-- Windows navigation
keymap('n', 'sp',      ':sp<CR>',     opts)
keymap('n', 'vs',      ':vs<CR>',     opts)
keymap('n', '<C-w>-',  ':split<CR>',  opts)
keymap('n', '<C-w>_',  ':vsplit<CR>', opts)
keymap('n', '<C-w>|',  ':vsplit<CR>', opts)

keymap('n', '<C-L>', '<C-W><C-L>', opts)
keymap('n', '<C-H>', '<C-W><C-H>', opts)
keymap('n', '<C-K>', '<C-W><C-K>', opts)
keymap('n', '<C-J>', '<C-W><C-J>', opts)

-- Window Zoom In/Out
keymap('n', '<LocalLeader>wi', '<C-w>| <C-w>_', opts)
keymap('n', '<LocalLeader>wo', '<C-w>=', opts)

-- Tab navigation
keymap('n', 'gT', ':TablineBufferPrevious<CR>',  opts)
keymap('n', 'gt', ':TablineBufferNext<CR>',      opts)

keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
keymap('n', 'to', ':tabo<CR>', { noremap = true })

-- Terminal mode
-- ------------------------------------------------------------------------
keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-----------------------------------------------------------------------------
keymap('n', 'fr', ':%s/', { noremap = true })

-- require('coc-config')
-- vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
-- vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
-- vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
-- vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

