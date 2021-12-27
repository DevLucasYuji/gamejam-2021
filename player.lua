-- presets player
playerWidth = 50
playerHeight = 100

-- TODO set spawn player by tiled map
playerStartX = window.width / 2 - playerWidth / 2 
playerStartY = 0

player = world:newRectangleCollider(playerStartX, playerStartY, playerWidth, playerHeight, {collision_class = "Player"})
player:setFixedRotation(true)
player.speed = 180
player.isGrounded = true
player.isMoving = false
player.jumpPower = 5000

function player:load()

end

function player:update(dt)
    if player.body then
        player:updateCam(dt)
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

function player:updateCam(dt)
    local px, py = player:getPosition()
    cam:lookAt(px, love.graphics.getHeight() / 2)
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

function player:initPosition(position)
    for i, obj in pairs(position) do
        playerStartX = obj.x
        playerStartY = obj.y
    end
    
    player:setPosition(playerStartX, playerStartY)
end