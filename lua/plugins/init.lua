if DEBUG then print('loading plugings...') end
-----------------------------------------------------------
-- Plugin Manager: install plugins
-----------------------------------------------------------
local fn = vim.fn
local package_root = PACKAGE_ROOT
local install_path = INSTALL_PATH
local compile_path = COMPILE_PATH
local packer_bootstrap

if vim.fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    if DEBUG then print('packer_bootstrap = ', packer_bootstrap) end
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
        use 'neovim/nvim-lspconfig'
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
            'kdheepak/tabline.nvim',
            require = {
                'hoob3rt/lualine.nvim',
                'kyazdani42/nvim-web-devicons'
            },
            config = function ()
                require('tabline').setup({ enable = false })
            end
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
        -- Snippets
        -- vscode-jest-snippets installation
        -- :CocInstall https://github.com/andys8/vscode-jest-snippets
        use 'honza/vim-snippets'
        -- Add indentation guides even on blank lines
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = [[ require('plugins.indent-blankline') ]]
        }
        -- Toggle comments in Neovim
        use 'tpope/vim-commentary'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use {
            'terrortylor/nvim-comment',
            config = function ()
                require('nvim_comment').setup()
            end
        }
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
        -- use {
        --     'mattn/emmet-vim',
        --     config = vim.cmd([[
        --         runtime ./lua/plugins/emmet-vim.rc.vim
        --     ]])
        -- }
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
