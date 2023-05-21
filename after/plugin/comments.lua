
-- Custom keybindings for todo comments look-up
vim.keymap.set('n', '<leader>qf', ':TodoQuickFix <Enter>')
vim.keymap.set('n', '<leader>tol', ':TodoTelescope <Enter>')

-- Easy commenting setup
local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
    return
end

comment.setup()
