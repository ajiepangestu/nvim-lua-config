-- Bufferline
local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup {
    options = {
        diagnostics = 'nvim_lsp',
        separator_style = 'thick',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        }
    }
}
