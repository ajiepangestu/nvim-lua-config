local status, plugin = pcall(require, 'telescope')
if not status then
    return
end
plugin.setup {}

