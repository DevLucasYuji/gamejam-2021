scoreText = 0
camX, camY = 0
font = {}
hudWidth = 0
hudHeight = 0

function drawHud()
    love.graphics.setColor(0, 0, 0, 1)

    scoreText = "Score: " .. SCORE
    camX, camY = cam:position()
    font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    
    hudWidth = camX - (window.width / 2) + 32
    hudHeight = camY - (window.height / 2) + 16
    love.graphics.print(scoreText, hudWidth, hudHeight)


    font = love.graphics.newFont(14)
    love.graphics.setFont(font)
    
    love.graphics.print("Fase: "  .. GAMEMAP.currentLevel.phase, hudWidth, hudHeight + 48)
    
    love.graphics.setColor(1, 1, 1, 1)
end