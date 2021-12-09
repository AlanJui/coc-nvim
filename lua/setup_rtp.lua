-----------------------------------------------------------
-- Setup runtimepath: stdpath('config'), stdpath('data')
-----------------------------------------------------------
if DEBUG then
    print('<< Begin of Initial Envirnoment >>')
    Print_rtp()
    print('CONFIG_DIR=', CONFIG_DIR)
    print('RUNTIME_DIR=', RUNTIME_DIR)
end

vim.opt.rtp:remove(Join_paths(vim.fn.stdpath('data'), 'site'))
vim.opt.rtp:remove(Join_paths(vim.fn.stdpath('data'), 'site', 'after'))
vim.opt.rtp:prepend(Join_paths(RUNTIME_DIR, 'site'))
vim.opt.rtp:append(Join_paths(RUNTIME_DIR, 'site', 'after'))

vim.opt.rtp:remove(vim.fn.stdpath('config'))
vim.opt.rtp:remove(Join_paths( vim.fn.stdpath('config'), 'after' ))
vim.opt.rtp:prepend(CONFIG_DIR)
vim.opt.rtp:append(Join_paths(CONFIG_DIR, 'after'))

vim.cmd [[let &packpath = &runtimepath]]
vim.cmd [["set spellfile" .. Join_paths(CONFIG_DIR, "spell", "en.utf-8.add")]]

if DEBUG then
    print('<< End of Initial Envirnoment >>')
    Print_rtp()
    print("stdpath('config')=" , vim.fn.stdpath('config'))
    print("stdpath('data')=", vim.fn.stdpath('data'))
end

