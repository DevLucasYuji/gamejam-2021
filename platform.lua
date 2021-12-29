platforms = {}

platform = {}

function spawnPlatforms(x, y, width, height)
    if width > 0 and height > 0 then
        platform = world:newRectangleCollider(x, y, width, height, {collision_class = "Platform"})
        platform:setType('static')
        table.insert(platforms, platform)
    end
end

function platforms:loadLayer(platforms)
    for i, obj in pairs(platforms) do
        spawnPlatforms(obj.x, obj.y, obj.width, obj.height)
    end
end

function platforms:clear()
    local i = #platforms
    while i > -1 do
        if platforms[i] ~= nil then
            platforms[i]:destroy()
        end
        table.remove(platforms, i)
        i = i - 1
    end
end