function love.load()

    -- Libraries
    Classe = require "libraries/classic"
    Vetor = require "libraries/vector"
    anim8 = require "libraries/anim8"
    sti = require "libraries/sti"
    wf = require "libraries/windfield"


    -- Classes
    require "classes/display"
    require "classes/player"
    require "classes/ball"
    require "jogo"


    love.graphics.setDefaultFilter("nearest", "nearest")
    gameMap = sti('img/map.lua')

    --  World & collision classes
    world = wf.newWorld(0, 400)
    world:addCollisionClass('Solid')
    world:addCollisionClass('Player')
    world:addCollisionClass('Ball')
    world:addCollisionClass('Ground')

    jogo = Jogo()
end

function love.update(dt)
    jogo:update(dt)
end

function love.draw()
    jogo:draw()

end