rubys = {}

function spawnRuby(x, y)
    local ruby = world:newRectangleCollider(x, y, 32, 32, {collision_class = "Ruby"})
    ruby:setType("static")
    ruby.x = x
    ruby.y = y
    table.insert(rubys, ruby)
end

function rubys:loadLayer(ruby)
    for i, obj in pairs(ruby) do
        spawnRuby(obj.x, obj.y)
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
    
function rubys:isCollidePlayer()
    for i, obj in ipairs(rubys) do
        local px, py = player:getPosition()
        local isCollide = distanceBetween(px, py, obj.x, obj.y) < 75
        if isCollide then 
            obj:destroy()
            table.remove(rubys, i) 
            return isCollide
        end
    end

    return false
end

function rubys:draw()
    for i, obj in ipairs(rubys) do
        love.graphics.draw(sprites.ruby, obj.x, obj.y, 0, 2, 2)
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