local M = {}

local compile_path
local package_root
local install_path
local system_name

if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    -- Unsupported system
    system_name = ''
end

OS_SYS = system_name
CONFIG_DIR = os.getenv('MY_CONFIG_DIR')
RUNTIME_DIR = os.getenv('MY_RUNTIME_DIR')
compile_path = CONFIG_DIR .. '/plugin/packer_compiled.lua'

-- Neovim defualt install path
-- local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
package_root = RUNTIME_DIR .. '/site/pack'
install_path = package_root .. '/packer/start/packer.nvim'

M.get_system = function ()
    return system_name
end

M.get_home = function ()
    return os.getenv('HOME')
end

M.get_package_root = function ()
    return package_root
end

M.get_compile_path = function ()
    return compile_path
end

M.get_install_path = function ()
    return install_path
end

return M
