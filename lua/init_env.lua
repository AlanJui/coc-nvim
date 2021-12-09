HOME = os.getenv('HOME')

CONFIG_DIR = os.getenv('MY_CONFIG_DIR')
if Is_empty(CONFIG_DIR) then
  CONFIG_DIR = HOME .. '/.config/' .. MY_VIM
end

RUNTIME_DIR = os.getenv('MY_RUNTIME_DIR')
if Is_empty(RUNTIME_DIR) then
  RUNTIME_DIR = HOME .. '/.local/share/' .. MY_VIM
end

COMPILE_PATH = CONFIG_DIR .. '/plugin/packer_compiled.lua'

-- Neovim defualt install path
-- local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
PACKAGE_ROOT = RUNTIME_DIR .. '/site/pack'
INSTALL_PATH = PACKAGE_ROOT .. '/packer/start/packer.nvim'

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  system_name = ''
end
OS_SYS = system_name
