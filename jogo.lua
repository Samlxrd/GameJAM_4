Jogo = Classe:extend()

function Jogo:new()
    self.state = nil
    defaultPositionOffset = 200

    win = nil
    id_p1 = 1
    id_p2 = 2
    hover = 0
    hover_color1 = {1, 1, 1}
    hover_color2 = {1, 1, 1}
    lastTouch = id_p1

    sprite = {}
    sprite.blue = 'img/blueDino.png'
    sprite.red = 'img/redDino.png'

    p1 = Player(id_p1, defaultPositionOffset, cfg.keybinds[1], sprite.blue)
    map = love.graphics.newImage('img/praia.png')
    ball = Ball(defaultPositionOffset)

    display = Display()
end

function Jogo:update(dt)

    -- Menu Selection mode
    if self.state == nil then
        local b1 = Vetor(BotaoSingleplayer:getWidth(), BotaoSingleplayer:getHeight())
        local b2 = Vetor(BotaoMultiplayer:getWidth(), BotaoMultiplayer:getHeight())
        mouse = Vetor(love.mouse.getX(), love.mouse.getY())

        if mouse.x > (width/2 - b1.x/2) and mouse.x < (width/2 - b1.x/2) + b1.x and mouse.y > 100 and mouse.y < 100 + b1.y then
            hover = 1
            if love.mouse.isDown(1) then
                p2 = Player(id_p2, -defaultPositionOffset, nil, sprite.red)
                self.state = 1
            end
        elseif mouse.x > (width/2 - b2.x/2) and mouse.x < (width/2 - b2.x/2) + b2.x and mouse.y > 160 and mouse.y < 160 + b2.y then
            hover = 2
            if love.mouse.isDown(1) then
                p2 = Player(id_p2, -defaultPositionOffset, cfg.keybinds[2], sprite.red)
                self.state = 1
            end
        else
            hover = 0
        end
        display:update(dt)
    else
        -- Collision handling (Ball x Player)
        if ball.collider:enter('Player') then

            local collision_data = ball.collider:getEnterCollisionData('Player')
            local player = collision_data.collider:getObject()

            if player.id == id_p1 then
                ball.collider:applyLinearImpulse(500, -1500)
            elseif player.id == id_p2 then
                ball.collider:applyLinearImpulse(-500, -1500)
            end
            lastTouch = player.id

        end

        -- Collision handling (Ball x Ground)
        if ball.collider:enter('Ground') then
            if lastTouch == id_p1 then
                if ball.collider:getX() > width / 2 then
                    p1.score = p1.score + 1
                    resetPosition = p1.position
                else
                    p2.score = p2.score + 1
                    resetPosition = p2.position
                end
            else
                if ball.collider:getX() < width / 2 then
                    p2.score = p2.score + 1
                    resetPosition = p2.position
                else
                    p1.score = p1.score + 1
                    resetPosition = p1.position
                end
            end

            -- Check Score
            if p1.score == 10 then
                win = 1
            elseif p2.score == 10 then
                win = 2
            end

            ball.collider:destroy()
            ball = Ball(resetPosition)
            p1:resetPosition()
            p2:resetPosition()
        end

        if win == nil then
            p1:update(dt)
            p2:update(dt)
            ball:update(dt)
            world:update(dt)
        end
    end
end

function Jogo:draw()
    love.graphics.draw(map)
    if self.state ~= nil then
        p1:draw()
        p2:draw()
        ball:draw()
    end
    --world:draw()
    display:draw()
end