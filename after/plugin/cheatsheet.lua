local status_ok, cs = pcall(require, 'cheatsheet')
if not status_ok then
    return
end

cs.setup({
    bundled_cheatsheets = true,
    bundled_plugin_cheatsheets = true,
    include_only_installed_plugins = true,
})
