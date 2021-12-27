platforms = {}

function spawnPlatforms(x, y, width, height)
    if width > 0 and height > 0 then
        local platform = world:newRectangleCollider(x, y, width, height, {collision_class = "Platform"})
        platform:setType('static')
        table.insert(platforms, platform)
    end
end

function platforms:draw(platforms)
    for i, obj in pairs(platforms) do
        spawnPlatforms(obj.x, obj.y, obj.width, obj.height)
    end
end

function platforms:clear()

end