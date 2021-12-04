-- telescope.nvim.lua
local telescope = require("telescope")
local actions = require('telescope.actions')

telescope.setup{
    pickers = {
        find_files = {
            theme = "ivy",
        }
    },
    defaults = {
        layout_config = {
            flex = {
                flip_columns = 130
            }
        },
        mappings = {
            n = {
                ['q'] = actions.close
            },
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
        layout_strategy = 'flex',
        vimgrep_arguments = {
            'rg',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        }
    }
}

telescope.load_extension("git_worktree")

-- keymap
local keymap = require('utils.set_keymap')
local opts = { noremap = true, silent = true }
keymap("n", "\\", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", ";b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", ";f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", ";g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", ";h", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap('n', ';t', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })
