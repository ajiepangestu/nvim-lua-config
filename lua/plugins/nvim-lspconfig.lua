local status, plugin = pcall(require, 'lspconfig')
if not status then
  return
end
plugin.pyright.setup {}
plugin.dartls.setup{}
plugin.tsserver.setup{}

