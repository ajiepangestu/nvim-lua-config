
local status, plugin = pcall(require, 'vim-visual-multi')
if not status then
  return
end
plugin.setup {}

