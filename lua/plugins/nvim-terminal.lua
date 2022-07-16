local status, plugin = pcall(require, 'nvim-terminal')
if not status then
  return
end
plugin.setup {
    window = {
        position = 'botright',
        split = 'sp',
        width = 50,
        height = 15
    },
    disable_default_keymaps = false,
    toggle_keymap = '<leader>;',
    -- Increase / Decrease Width
    window_width_change_amount = 2,
    increase_width_keymap = '<leader><leader>+',
    decrease_width_keymap = '<leader><leader>-',
    -- Increase / Decrease Height
    window_height_change_amount = 2,
    increase_height_keymap = '<leader>+',
    decreate_height_keymap = '<leader>-',
    -- Terminal
    terminals = {
        {
            keymap = '<leader>1'
        },
        {
            keymap = '<leader>2'
        },
        {
            keymap = '<leader>3'
        },
        {
            keymap = '<leader>4'
        },
        {
            keymap = '<leader>5'
        }
    }
}
vim.o.hidden = true

