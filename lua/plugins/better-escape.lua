local status, plugin = pcall(require, 'better_escape')
if not status then
    return
end
plugin.setup {}

