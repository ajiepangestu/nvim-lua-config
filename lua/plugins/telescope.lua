-- Telescope (File Finder)
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            '.git',         -- git folder
            'node_modules', -- nodejs libs
            '.venv'         -- python environment
        }
    }
}

