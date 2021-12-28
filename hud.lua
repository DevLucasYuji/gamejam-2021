function drawHud()
    love.graphics.setColor(0, 0, 0, 1)

    local scoreText = "Score: " .. SCORE
    local camX, camY = cam:position()
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    
    local width = camX - (window.width / 2) + 32
    love.graphics.print(scoreText, width, 16)


    local font = love.graphics.newFont(14)
    love.graphics.setFont(font)
    
    love.graphics.print("Fase: "  .. GAMEMAP.currentLevel.phase, width, 54)
    
    love.graphics.setColor(1, 1, 1, 1)
end