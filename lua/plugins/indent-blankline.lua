local status, plugin = pcall(require, 'indent_blankline')
if not status then
    return
end

plugin.setup {
    use_treesitter = true,
    show_first_indent_level = false
}
