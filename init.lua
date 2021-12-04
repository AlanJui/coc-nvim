-- Essential configuration on development init.lua
-----------------------------------------------------------
require('essential')

-- Plugin Manager: install plugins
-----------------------------------------------------------
-- /home/alanjui/.config/coc/extensions/coc-sumneko-lua-data/sumneko-lua-ls
local fn = vim.fn
local home_path = os.getenv('HOME')
local my_nvim = 'quick-nvim'
local package_root = home_path .. '/.local/share/' .. my_nvim .. '/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
local compile_path = home_path .. '/.config/' .. my_nvim .. '/plugin/packer_compiled.lua'
local packer_bootstrap

-- print('install_path = ', install_path)
if vim.fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    print('packer_bootstrap = ', packer_bootstrap)
end

require('packer').init({
    package_root = package_root,
    compile_path = compile_path,
})

local use = require('packer').use
require('packer').startup({
    function()
        use 'wbthomason/packer.nvim'
        use {'neoclide/coc.nvim', branch = 'release'}
        use {'rafcamlet/coc-nvim-lua'}
        use 'folke/tokyonight.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'tpope/vim-commentary'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use 'ThePrimeagen/git-worktree.nvim'
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use {
            "blackCauldron7/surround.nvim",
            config = function()
                require('surround').setup({
                    mappings_style = "surround",
                    context_offset = 100,
                    load_autogroups = false,
                    map_insert_mode = true,
                    quotes = {"'", '"'},
                    brackets = {"(", '{', '['},
                    pairs = {
                        nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
                        linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
                    },
                    prefix = "s",
                })
            end
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,

    config = {
        compile_path = compile_path,
        display = {
            open_fn = require('packer.util').float,
        }
    },
})

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost ~/.config/nvim/init.lua PackerCompile
autocmd BufWritePost ~/.config/quick-nvim/init.lua PackerCompile
augroup end
]])

-- Themes
-- Tokyo Night Color Scheme Configuration
vim.cmd([[ colorscheme tokyonight ]])
vim.g.tokyonight_style = 'storm'
-- vim.g.tokyonight_style = 'day'
-- vim.g.tokyonight_style = 'night'
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

-- Original Configuration
-----------------------------------------------------------
require('basics')
require('telescope-config')
require('coc-config')
require('lualine').setup()

require('nvim-treesitter.configs').setup({
    -- ensure_installed = "maintained",
	ensure_installed = {
		'tsx',
		'toml',
		'yaml',
		'bash',
		'json',
		'comment',
		'html',
		'css',
		'scss',
		'lua',
		'python',
	},
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})

-- My Configuration
-----------------------------------------------------------
require('keymaps')
