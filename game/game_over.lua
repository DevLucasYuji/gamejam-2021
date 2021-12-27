function updateGameOver(dt)
    world:update(dt)
end

function drawGameOver()
    world:draw()
    drawMap()

    local text = "GAMEOVER!"
    local cx, cy = cam:position()
    local font = love.graphics.newFont(40)
    love.graphics.setFont(font)

    local fw = font:getWidth(text) / 2
    local fh = font:getHeight(text) / 2
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(text, cx - fw, cy - fh)
end