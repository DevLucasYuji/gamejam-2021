function updateGameResume(dt)
    world:update(dt)
    player:update(dt)
end

function drawGameResume()
    world:draw()
    drawMap()

    player:draw()

    drawHud()
end

function keypressedResume(key)
    player:keypressed(key)
end