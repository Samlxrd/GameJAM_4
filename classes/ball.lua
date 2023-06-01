Ball = Classe:extend()

function Ball:new(position)
    self.img = love.graphics.newImage("img/ball.png")
    self.collider = world:newCircleCollider(width/2 - position, 150, 16)
    self.x, self.y = self.collider:getPosition()
    self.collider:setCollisionClass('Ball')
    self.collider:setRestitution(0.8)
    self.collider:setObject(self)
end

function Ball:update(dt)
    local vx, vy = self.collider:getLinearVelocity()

    if vx > 400 then
        self.collider:setLinearVelocity(400,vy)
    end

    if vy > 400 then
        self.collider:setLinearVelocity(vx, 400)
    end

    if vy < -400 then
        self.collider:setLinearVelocity(vx, -400)
    end

    self.x = self.collider:getX() - 15
    self.y = self.collider:getY() - 15
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y, nil)
end