-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
MY_VIM = 'coc-nvim'
DEBUG = false
-- DEBUG = true

if DEBUG then print('===== Begin of loading init.lua... =====') end
-----------------------------------------------------------
-- Essential configuration on development init.lua
-----------------------------------------------------------
require('essential')
require('nvim_utils')

-----------------------------------------------------------
-- Initial environment
-----------------------------------------------------------
require('init_env')

-----------------------------------------------------------
-- Setup runtimepath: stdpath('config'), stdpath('data')
-----------------------------------------------------------
require('setup_rtp')

-----------------------------------------------------------
-- Plugin Manager: install plugins
-----------------------------------------------------------
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost ~/.config/coc-nvim/lua/plugins/init.lua source <afile> | PackerCompile
-- augroup end
-- ]])
local autocmds = {
    packer_user_config = {
        { "BufWritePost " .. CONFIG_DIR .. "/lua/plugins/init.lua source <afile> | PackerCompile " },
    }
}
nvim_create_augroups(autocmds)
require('plugins')

-----------------------------------------------------------
-- Set configurations for Neovim
-----------------------------------------------------------
require('settings')

-- coc.nvim configuration
vim.cmd([[
runtime ./coc-nvim.rc.vim
]])

-- configuration for nvim-tree to show directory specified when nvim stared
vim.cmd([[
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
\ wincmd p | enew | execute 'cd ' .argv()[0] | endif
]])

-- Themes
-- Tokyo Night Color Scheme Configuration
-- vim.g.tokyonight_style = 'day'
-- vim.g.tokyonight_style = 'night'
vim.cmd([[ colorscheme tokyonight ]])
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_sidebars = {
    'qf',
    'vista_kind',
    'terminal',
    'packer',
}
-- Change the "hint" color to the "orange" color,
-- and make the "error" color bright red
vim.g.tokyonight_colors = {
    hint = 'orange',
    error = '#ff0000'
}

-----------------------------------------------------------
-- Key bindings
-----------------------------------------------------------
-- Load Shortcut Key
require('keymaps')

-- Load Which-key
require('plugins.vim-which-key')
