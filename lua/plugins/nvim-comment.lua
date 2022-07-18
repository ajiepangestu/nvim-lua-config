local status, plugin = pcall(require, 'nvim_comment')
if not status then
  return
end
plugin.setup {
    comment_empty = false
}

