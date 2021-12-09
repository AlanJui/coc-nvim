-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
MY_VIM = 'coc-nvim'
CONFIG_DIR = os.getenv('MY_CONFIG_DIR')
RUNTIME_DIR = os.getenv('MY_RUNTIME_DIR')

DEBUG = false
-- DEBUG = true

if DEBUG then print('===== Begin of loading init.lua... =====') end
-----------------------------------------------------------
local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local function join_paths(...)
    local result = table.concat({ ... }, path_sep)
    return result
end

local function print_rtp()
    print(string.format('rtp = %s', vim.opt.rtp['_value']))
end

-----------------------------------------------------------
-- Initial environment
-----------------------------------------------------------
if DEBUG then
    print('<< Begin of Initial Envirnoment >>')
    print_rtp()
    print('CONFIG_DIR=', CONFIG_DIR)
    print('RUNTIME_DIR=', RUNTIME_DIR)
end

vim.opt.rtp:remove(join_paths(vim.fn.stdpath('data'), 'site'))
vim.opt.rtp:remove(join_paths(vim.fn.stdpath('data'), 'site', 'after'))
vim.opt.rtp:prepend(join_paths(RUNTIME_DIR, 'site'))
vim.opt.rtp:append(join_paths(RUNTIME_DIR, 'site', 'after'))

vim.opt.rtp:remove(vim.fn.stdpath('config'))
vim.opt.rtp:remove(join_paths( vim.fn.stdpath('config'), 'after' ))
vim.opt.rtp:prepend(CONFIG_DIR)
vim.opt.rtp:append(join_paths(CONFIG_DIR, 'after'))

vim.cmd [[let &packpath = &runtimepath]]
vim.cmd [["set spellfile" .. join_paths(CONFIG_DIR, "spell", "en.utf-8.add")]]

if DEBUG then
    print('<< End of Initial Envirnoment >>')
    print_rtp()
    print("stdpath('config')=" , vim.fn.stdpath('config'))
    print("stdpath('data')=", vim.fn.stdpath('data'))
end

-----------------------------------------------------------
-- Essential configuration on development init.lua
-----------------------------------------------------------
require('essential')
require('nvim_utils')

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
require('keymaps')

-- Load Which-key
require('plugins.vim-which-key')
