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

-- Telescope Extensions
telescope.load_extension('file_browser')

local extension, _ = pcall(require, 'project_nvim')
if extension then
    telescope.load_extension('projects')
end
