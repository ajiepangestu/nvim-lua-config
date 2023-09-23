-- Current Context Identifier
local status_ok, treesitter_context = pcall(require, 'treesitter-context')
if not status_ok then
    return
end

treesitter_context.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = null
}
