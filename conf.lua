function love.conf(t)
    t.console = true
    t.window.title = "Volleyball - GameJAM 4"
    t.window.icon = nil
    t.window.width = 832
    t.window.height = 640
    t.window.resizable = false
    t.window.vsync = true

    cfg = {
        keybinds = {
            {
                up = 'w',
                right = 'd',
                left = 'a'
            },
            {
                up = 'up',
                right = 'right',
                left = 'left'
            }
        }
    }
end