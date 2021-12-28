function drawHud()
    local scoreText = "Score: " .. SCORE
    local camX, camY = cam:position()
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    
    local width = camX - (window.width / 2) + 32
    love.graphics.print(scoreText, width, 16)
end