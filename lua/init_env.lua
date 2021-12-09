CONFIG_DIR = os.getenv('MY_CONFIG_DIR')
RUNTIME_DIR = os.getenv('MY_RUNTIME_DIR')
COMPILE_PATH = CONFIG_DIR .. '/plugin/packer_compiled.lua'

-- Neovim defualt install path
-- local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
PACKAGE_ROOT = RUNTIME_DIR .. '/site/pack'
INSTALL_PATH = PACKAGE_ROOT .. '/packer/start/packer.nvim'
