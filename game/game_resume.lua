function updateGameResume(dt)
    world:update(dt)
    player:update(dt)
    rubys:update(dt)
    enemies:update(dt)
end

function drawGameResume()
    world:draw()
    drawMap()
    drawGame()
    drawHud()
end

function keypressedResume(key)
    player:keypressed(key)
end