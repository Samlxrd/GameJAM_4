Display = Classe:extend()

function Display:new()
    font = love.graphics.newFont('fonts/CANDARA.TTF', 32)
    love.graphics.setFont(font)
    BotaoSingleplayer = love.graphics.newImage('img/BotaoSingleplayer.png')
    BotaoMultiplayer = love.graphics.newImage('img/BotaoMultiplayer.png')
end

function Display:update(dt)
    if hover == 1 then
        hover_color1 = { 1, 1, 1, 0.5 }
    elseif hover == 2 then
        hover_color2 = { 1, 1, 1, 0.5 }
    else
        hover_color1 = {1, 1, 1}
        hover_color2 = {1, 1, 1}
    end
end

function Display:draw()
    if jogo.state == nil then
        love.graphics.setColor(hover_color1)
        love.graphics.draw(BotaoSingleplayer, width/2 - BotaoSingleplayer:getWidth()/2, 100)
        love.graphics.setColor(hover_color2)
        love.graphics.draw(BotaoMultiplayer, width/2 - BotaoMultiplayer:getWidth()/2, 160)
    end

    love.graphics.setColor(1, 1, 1)

    if jogo.state == 1 then
        text = "Player 1:  ".. p1.score .. "\t\t\t\t\t\t\t\t" .. "Player 2:  ".. p2.score
        local x = love.graphics.getWidth()
        local font = love.graphics.getFont()
        local fx = font.getWidth(font, text)/2
        love.graphics.print(text, x/2 - fx, 30, 0, 1,1,0)
    end

    if win then
        text = "Player ".. win .. " venceu o jogo!"
        local wx = love.graphics.getWidth()
        local f2x = font.getWidth(font, text)/2
        love.graphics.print(text, wx/2 - f2x, 150, 0, 1,1,0)
    end
end