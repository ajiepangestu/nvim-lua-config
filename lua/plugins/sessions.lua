-- Sessions
local status_ok, sessions = pcall(require, 'sessions')
if not status_ok then
    return
end

sessions.setup {
    events = { 'WinEnter' },
    session_filepath = '.nvim/session',
}
