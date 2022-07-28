local status, plugin = pcall(require, 'goto-preview')
if not status then
    return
end
plugin.setup {}

