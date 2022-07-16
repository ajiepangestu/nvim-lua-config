local status, plugin = pcall(require, 'nvim-tree')
if not status then
  return
end
plugin.setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
}

