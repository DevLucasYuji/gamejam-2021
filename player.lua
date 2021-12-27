player = world:newRectangleCollider(0, 0, 50, 100)
player:setFixedRotation(true)
player.speed = 180
player.isGrounded = true
player.isMoving = false

function player:load()

end

function player:update(dt)
    if player.body then
        player:move(dt)
    end
end

function player:draw()
end

function player:move(dt)    
    local px, py = player:getPosition()
    player.isMoving = false

    if love.keyboard.isDown("left") then
        player:setX(px - player.speed * dt)
        player.isMoving = true
        player.direction = -1
    end

    if love.keyboard.isDown("right") then
        player:setX(px + player.speed * dt)
        player.isMoving = true
        player.direction = 1
    end
end

function player:keypressed(key)
    if key == "up" and player.body then
        if player.isGrounded then
            player:jump()
        end
    end
end

function player:jump()
    -- TODO set jump sound
    player:applyLinearImpulse(0, -4000)
end