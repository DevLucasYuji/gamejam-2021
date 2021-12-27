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

function jarvis:clear()
    jarvis.x = 0
    jarvis.y = 0
end

function jarvis:isCollidePlayer()
    local jarvis = world:queryCircleArea(jarvis.x, jarvis.y, 10, {'Player'})
    return #jarvis > 0
end