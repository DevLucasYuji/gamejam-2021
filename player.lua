-- presets player
playerWidth = 32
playerHeight = 64

-- TODO set spawn player by tiled map
playerStartX = window.width / 2 - playerWidth / 2 
playerStartY = 0

player = world:newRectangleCollider(playerStartX, playerStartY, playerWidth, playerHeight, {collision_class = "Player"})
player:setFixedRotation(true)
player.speed = 360
player.isGrounded = true
player.direction = 1
player.jumpPower = 2250

player.grid = anim8.newGrid(25, 74, sprites.player:getWidth(), sprites.player:getHeight())

player.animations = {}
player.animations.idle = anim8.newAnimation(player.grid('1-1', 1), 0.2)
player.animations.side = anim8.newAnimation(player.grid('1-4', 1), 0.2)

player.animation = player.animations.idle

function player:load()
    player:setPosition(playerStartX, playerStartY)
end

function player:update(dt)
    if player.body then
        player:updateCam(dt)
        player:updateGround()
        player:move(dt)
    end
end

function player:draw()
    player.animation:draw(sprites.player, player:getX(), player:getY(), nil, player.direction * 1, 1, 10, 40)
end

function player:updateGround()
    player.isGrounded = #world:queryRectangleArea(
        player:getX() - playerWidth / 4, 
        player:getY() + playerHeight / 2, 
        20, 2, {'Platform'}
    ) > 0
end

function player:updateCam(dt)
    local px, py = player:getPosition()
    local middleY = window.height / 2
    local middleX = window.width / 2

    local gameWidth = GAMEMAP.width * 16
    local endWidth = gameWidth - middleX

    px = px < middleX and middleX or px
    px = px > endWidth and endWidth or px

    -- py = py > middleY and middleY or py

    cam:lookAt(px, middleY)
end

function player:move(dt)    
    player.animation = player.animations.idle

    if love.keyboard.isDown("left") then
        player:setX(player:getX() - player.speed * dt)
        player.animation = player.animations.side
        player.direction = -1
    end

    if love.keyboard.isDown("right") then
        player:setX(player:getX() + player.speed * dt)
        player.animation = player.animations.side
        player.direction = 1
    end

    if jarvis:isCollidePlayer() then
        loadNextMap()
    end

    if rubys:isCollidePlayer() then
        player:collect()
    end

    if player:enter("Danger") or player:enter("Enemy") then
        player:dead()
        GAMESTATE = game.state.gameover
    end

    player.animation:update(dt)
end

function player:keypressed(key)
    if key == "up" and player.body then
        if player.isGrounded then
            player:jump()
        end
    end
end

function player:jump()
    sound:playJump()
    player:applyLinearImpulse(0, -player.jumpPower)
end

function player:loadLayer(positionLayer)
    for i, obj in pairs(positionLayer) do
        playerStartX = obj.x
        playerStartY = obj.y
    end

    player:load()
end

function player:collect()
    SCORE = SCORE + 1
    sound:playRuby()
end

function player:dead()
    sound.gameover:play()
end