rubys = {}

function spawnRuby(x, y, width, height)
    if width > 0 and height > 0 then
        local ruby = world:newRectangleCollider(x, y, width, height, {collision_class = "Ruby"})
        ruby:setType('static')
        table.insert(rubys, ruby)
    end
end

function rubys:loadLayer(ruby)
    for i, obj in pairs(platforms) do
        spawnRuby(obj.x, obj.y, obj.width, obj.height)
    end
end

function rubys:clear()
    local i = #rubys
    while i > -1 do
        if rubys[i] ~= nil then
            rubys[i]:destroy()
        end
        table.remove(rubys, i)
        i = i - 1
    end
end