jarvis = {}
jarvis.x = 0
jarvis.y = 0

function jarvis:loadLayer(jarvisLayer)
    for i, obj in pairs(jarvisLayer) do
        spawnJarvis(obj.x, obj.y)
    end
end

function spawnJarvis(x, y)
    jarvis.x = x
    jarvis.y = y
end

function jarvis:draw()
    local jarvisHeight = sprites.jarvis:getHeight() / 2
    love.graphics.draw(sprites.jarvis, jarvis.x, jarvis.y - jarvisHeight, 0, -1, 1)
end

function jarvis:clear()
    jarvis.x = 0
    jarvis.y = 0
end

function jarvis:isCollidePlayer()
    local jarvis = world:queryCircleArea(jarvis.x, jarvis.y, 75, {'Player'})
    return #jarvis > 0
end