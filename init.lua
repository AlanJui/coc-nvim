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
        -----------------------------------------------------------
        -- LSP Tools
        -----------------------------------------------------------
        use {'neoclide/coc.nvim', branch = 'release'}
        use {'rafcamlet/coc-nvim-lua'}
        -----------------------------------------------------------
        -- Treesitter: for better syntax
        -----------------------------------------------------------
        -- Nvim Treesitter configurations and abstraction layer
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            -- config = [[ require('plugins.treesitter') ]]
            config = [[ require('plugins.nvim-treesitter') ]]
        }
        -- Additional textobjects for treesitter
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        -----------------------------------------------------------
        -- User Interface
        -----------------------------------------------------------
        -- Color scheme
        use 'folke/tokyonight.nvim'
        -- Status Line
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
            config = [[ require('plugins.lualine.material') ]]
            -- config = [[ require('plugins.lualine.bubbles') ]]
            -- config = [[ require('plugins.lualine.lualine-nvim') ]]
        }
        use {
            'arkav/lualine-lsp-progress',
            -- config = [[ require('plugins.lualine.lualine-lsp-progress') ]]
        }
        use {
            'kdheepak/tabline.nvim',
            require = {
                'hoob3rt/lualine.nvim',
                'kyazdani42/nvim-web-devicons'
            },
            config = function ()
                require('tabline').setup({ enable = false })
            end
        }
        -- Utility functions for getting diagnostic status and progress messages
        -- from LSP servers, for use in the Neovim statusline
        use {
            'nvim-lua/lsp-status.nvim',
            config = [[ require('plugins.lspstatus') ]]
        }
        -- Icons
        use { 'kyazdani42/nvim-web-devicons' }
        -- Fuzzy files finder
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/plenary.nvim', },
                { 'nvim-telescope/telescope-live-grep-raw.nvim' },
            },
            config = [[ require('plugins.telescope-nvim') ]]
        }
        -- File/Flolders explorer:nvim-tree
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = [[ require('plugins.nvim-tree') ]]
        }
        -- Screen Navigation
        use {
            'liuchengxu/vim-which-key',
            -- config = [[ require('plugins.vim-which-key') ]]
        }
        -----------------------------------------------------------
        -- Version Management Tools
        -----------------------------------------------------------
        -- Git worktree
        use 'ThePrimeagen/git-worktree.nvim'
        -- Git commands in nvim
        use 'tpope/vim-fugitive'
        -- Fugitive-companion to interact with github
        use 'tpope/vim-rhubarb'
        -- Add git related info in the signs columns and popups
        use {
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function ()
                require('gitsigns').setup()
            end
        }
        -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
        use {
            'TimUntersberger/neogit',
            requires = {
                'nvim-lua/plenary.nvim',
                'sindrets/diffview.nvim',
            },
            config = [[ require('plugins.neogit') ]]
        }
        -----------------------------------------------------------
        -- Editting Tools
        -----------------------------------------------------------
        -- Add indentation guides even on blank lines
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = [[ require('plugins.indent-blankline') ]]
        }
        -- Toggle comments in Neovim
        use 'tpope/vim-commentary'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        -- visualizes undo history and makes it easier to browse and switch between different undo branches
        use {
            'mbbill/undotree',
            config = [[ require('plugins.undotree') ]]
        }
        -- Causes all trailing whitespace characters to be highlighted
        use {
            'ntpeters/vim-better-whitespace',
            config = vim.cmd([[
                runtime ./lua/plugins/vim-better-whitespace.rc.vim
            ]])
        }
        -- Multiple cursor editting
        use 'mg979/vim-visual-multi'
        -- Auto close parentheses and repeat by dot dot dot ...
        -- use 'jiangmiao/auto-pairs'
        use {
            'windwp/nvim-autopairs',
            config = [[ require('plugins.autopairs') ]]
        }
        -- surroundings: parentheses, brackets, quotes, XML tags, and more
        -- use 'tpope/vim-surround'
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
        ---------------------------------------------------------------
        -- HTML
        ---------------------------------------------------------------
        -- provides support for expanding abbreviations similar to emmet
        use {
            'mattn/emmet-vim',
            config = vim.cmd([[
                runtime ./lua/plugins/emmet-vim.rc.vim
            ]])
        }
        -- Auto close tag
        use {
            'alvan/vim-closetag',
            config = vim.cmd([[
                runtime ./lua/plugins/vim-closetag.rc.vim
            ]])
        }
        -- Auto change html tags
        use {
            'AndrewRadev/tagalong.vim',
            config = vim.cmd([[
                runtime ./lua/plugins/tagalong-vim.rc.vim
            ]])
        }
        -- Use treesitter to autoclose and autorename HTML tag
        -- use {
        --     'windwp/nvim-ts-autotag',
        --     config = [[ require('plugins.nvim-ts-autotag') ]]
        -- }
        ---------------------------------------------------------------
        -- Python
        ---------------------------------------------------------------
        -- ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
        -- checking and semantic errors) in NeooVim while you edit your text files,
        -- and acts as a Vim Language Server Protocol client.
        -- use {
        --     'dense-analysis/ale',
        --     config = vim.cmd([[
        --         runtime ./lua/plugins/ale.rc.vim
        --     ]])
        -- }
        --  Modifies Vim’s indentation behavior to comply with PEP8 and my aesthetic preferences.
        use 'Vimjas/vim-python-pep8-indent'
        -- Python: provides text objects and motions for Python classes, methods,
        -- functions and doc strings
        use 'jeetsukumaran/vim-pythonsense'
        -----------------------------------------------------------
        -- Utility
        -----------------------------------------------------------
        -- Floater Terminal
        use 'voldikss/vim-floaterm'
        -- highlight your todo comments in different styles
        use {
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function ()
                require('todo-comments').setup({
                    -- configuration comes here
                    -- or leave it empty to use the default setting
                })
            end
        }
        -- Live server
        use 'turbio/bracey.vim'
        -- Markdown preview
        use {
            'instant-markdown/vim-instant-markdown',
            config = vim.cmd([[
                runtime ./lua/plugins/vim-instant-markdown.rc.vim
            ]])
        }
        -- PlantUML
        use {
            'weirongxu/plantuml-previewer.vim',
            config = vim.cmd([[
                runtime ./lua/plugins/plantuml-previewer.rc.vim
            ]])
        }
        -- PlantUML syntax highlighting
        use 'aklt/plantuml-syntax'
        -- Open URI with your favorite browser from your most favorite editor
        use 'tyru/open-browser.vim'

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

-- Configurations for Neovim
-----------------------------------------------------------
require('basics')

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

-- Key bindings
-----------------------------------------------------------
require('keymaps')

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
-- require('coc-config')
vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

-- Load Which-key
require('plugins.vim-which-key')
