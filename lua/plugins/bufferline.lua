-- Bufferline
local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup {
    options = {
        separator_style = 'thin',
        diagnostic = "coc",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = 'center',
                highlight = "Directory",
                separator = false
            }
        }

    }

}
