rubys = {}

function spawnRuby(x, y)
    local ruby = {}
    ruby.grid = anim8.newGrid(18, 16, sprites.ruby:getWidth(), sprites.ruby:getHeight())
    ruby.animations = {}

    ruby.animations.play = anim8.newAnimation(ruby.grid('1-4', 1), 0.2)
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
        if distanceBetween(px, py, obj.x, obj.y) < 75 then 
            table.remove(rubys, i) 
            return true
        end
    end

    return false
end

function rubys:update(dt) 
    for i, obj in ipairs(rubys) do
        obj.animations.play:update(dt)
    end
end

function rubys:draw()
    for i, obj in ipairs(rubys) do
        obj.animations.play:draw(sprites.ruby, obj.x, obj.y, nil, 2 * -1, 2)
    end
end

function rubys:clear()
    local i = #rubys
    while i > -1 do
        table.remove(rubys, i)
        i = i - 1
    end
end