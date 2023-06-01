Player = Classe:extend()

function Player:new(id, position, keybinds, sprite)
    width, height = love.graphics.getDimensions()
    self.spriteSheet = love.graphics.newImage(sprite)

    -- Animations
    self.grid = anim8.newGrid(24, 24, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
    self.animations = {}
    self.animations.idle = anim8.newAnimation(self.grid('1-4', 2), 0.2)
    self.animations.right = anim8.newAnimation(self.grid('5-9', 2), 0.2)
    self.animations.up = anim8.newAnimation(self.grid('18-24', 2), 0.2)
    self.animations.left = anim8.newAnimation(self.grid('20-16', 1), 0.2)
    self.anim = self.animations.idle


    -- Player Attributes
    self.id = id
    self.score = 0
    self.keybinds = keybinds
    self.maxSpeedX = 350
    self.maxSpeedY = 250
    self.position = position
    self.collider = world:newBSGRectangleCollider(width/2 - self.position, height - 48, 24, 36, 2)
    self.collider:setFixedRotation(true)
    self.collider:setCollisionClass('Player')
    self.collider:setObject(self)
    self.onGround = true


    -- Walls
    walls = {}

    if gameMap.layers["Walls"] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            if i == 5 then
                wall:setCollisionClass('Ground')
            else
                wall:setCollisionClass('Solid')
            end
            table.insert(walls, wall)
        end
    end
end

function Player:update(dt)
    self.vx, self.vy = self.collider:getLinearVelocity()

    if self.keybinds then
        if love.keyboard.isDown(self.keybinds.up) and self.onGround == true then
            self.collider:applyForce(0, -50000)
        end

        if love.keyboard.isDown(self.keybinds.right) and self.vx < self.maxSpeedX then
            self.anim = self.animations.right
            self.collider:applyForce(1500,0)

        elseif love.keyboard.isDown(self.keybinds.left) and self.vx > -self.maxSpeedX then
            self.collider:applyForce(-1500,0)
            self.anim = self.animations.left

        else
            self.anim = self.animations.idle
        end

     -- IA Movement
    else
        local ballx, bally = ball.collider:getX(), ball.collider:getY()

        if ballx > width/2 and bally > 350 then
            if math.abs(self.collider:getY() - bally) < 60 and self.onGround == true and
               math.abs(self.collider:getX() - ballx) < 20 then
                self.collider:applyForce(0, -50000)
            end

            if self.collider:getX() > ballx then
                self.collider:setX(self.collider:getX() - 4)
            elseif self.collider:getX() < ballx then
                self.collider:setX(self.collider:getX() + 4)
            end
        end
    end

    if self.vy > self.maxSpeedY then
        self.collider:setLinearVelocity(self.vx, self.maxSpeedY)
    end

    if self.vy < -self.maxSpeedY then
        self.collider:setLinearVelocity(self.vx, -self.maxSpeedY)
    end

    if self.collider:enter('Ground') then
        self.onGround = true
    end

    if self.collider:exit('Ground') then
        self.onGround = false
    end

    self.x = self.collider:getX() - 24
    self.y = self.collider:getY() - 24
    self.anim:update(dt)
end

function Player:draw()
    self.anim:draw(self.spriteSheet, self.x, self.y, nil, 2)
end

function Player:resetPosition()
    self.collider:setX(width/2 - self.position)
end