local status, plugin = pcall(require, 'tabline')
if not status then
    return
end
plugin.setup {
    enable = true,
    options = {
        show_filename_only = true,
        section_separators = {'', ''},
        component_separators = {'', ''}
    }
}
