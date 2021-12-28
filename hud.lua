function drawHud()
    love.graphics.setColor(0, 0, 0, 1)

    local scoreText = "Score: " .. SCORE
    local camX, camY = cam:position()
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    
    local width = camX - (window.width / 2) + 32
    local height = camY - (window.height / 2) + 16
    love.graphics.print(scoreText, width, height)


    local font = love.graphics.newFont(14)
    love.graphics.setFont(font)
    
    love.graphics.print("Fase: "  .. GAMEMAP.currentLevel.phase, width, height + 48)
    
    love.graphics.setColor(1, 1, 1, 1)
end