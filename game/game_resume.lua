function updateGameResume(dt)
    world:update(dt)
    player:update(dt)
end

function drawGameResume()
    drawMap()

    player:draw()
    jarvis:draw()

    drawHud()
end

function keypressedResume(key)
    player:keypressed(key)
end