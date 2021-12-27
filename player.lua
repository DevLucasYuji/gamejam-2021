-- presets player
playerWidth = 50
playerHeight = 100
playerX = 0
playerY = 0

player = world:newRectangleCollider(playerX, playerY, playerWidth, playerHeight, {collision_class = "Player"})
player:setFixedRotation(true)
player.speed = 180
player.isGrounded = true
player.isMoving = false
player.jumpPower = 5000

function player:load()

end

function player:update(dt)
    if player.body then
        player:updateGround()
        player:move(dt)
    end
end

function player:draw()
end

function player:updateGround()
    local colX = player:getX() - playerWidth / 2
    local colY = player:getY() + playerHeight / 2
    local colliders = world:queryRectangleArea(colX, colY, 50, 2, { 'Platform'})
    player.isGrounded = #colliders > 0
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
    player:applyLinearImpulse(0, -player.jumpPower)
end