function updateGameOver(dt)
    world:update(dt)
end

function drawGameOver()
    printGameOver()

    drawHud()

    drawMap()

end

function printGameOver()
    love.graphics.setColor(0, 0, 0, 1)
    local text = "GAMEOVER!"
    local cx, cy = cam:position()

    local font = love.graphics.newFont(40)
    love.graphics.setFont(font)

    local fw = font:getWidth(text) / 2
    local fh = font:getHeight(text) / 2

    love.graphics.print(text, cx - fw, cy - fh - 32)
    local font = love.graphics.newFont(16)
    love.graphics.setFont(font)

    local fw = font:getWidth(text)
    local fh = font:getHeight(text) / 2
    
    love.graphics.print("Press enter to play again", cx - fw, cy - fh + 8)
    love.graphics.setColor(1, 1, 1, 1)
end

function keypressedGameOver(key)
    if key == "return" then
        resetGame()
    end
end