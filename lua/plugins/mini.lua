-- Mini Animations
local status_ok, mini_animate = pcall(require, 'mini.animate')
if not status_ok then
    return
end

mini_animate.setup {}

