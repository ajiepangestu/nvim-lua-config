-- Auto Pair Bracket
local status_ok, nvim_autopairs = pcall(require, 'nvim_autopairs')
if not status_ok then
    return
end

nvim_autopairs.setup {
    disable_filetype = {
        "TelescopePrompt"
    },
}

