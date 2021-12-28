enemies = {}

function spawnEnemies(x, y)
    local enemy = world:newRectangleCollider(x, y, 64, 64, {collision_class = "Enemy"})
    local ex, ey = enemy:getPosition()
    enemy.pivotX = ex
    enemy.speed = 360
    enemy.direction = 1
    table.insert(enemies, enemy)
end

function enemies:loadLayer(enemies)
    for i, obj in pairs(enemies) do
        spawnEnemies(obj.x, obj.y, obj.width, obj.height)
    end
end

function enemies:clear()
    local i = #enemies
    while i > -1 do
        if enemies[i] ~= nil then
            enemies[i]:destroy()
        end
        table.remove(enemies, i)
        i = i - 1
    end
end

function enemies:drawLayer()
    
end

function enemies:update(dt)
    for i, enemy in ipairs(enemies) do
        local ex, ey = enemy:getPosition()
        local maxX = enemy.pivotX + 300
        local minX = enemy.pivotX - 300

        if ex > maxX then
            enemy.direction = -1
        end
        
        if ex < minX then
            enemy.direction = 1
        end
        
        local colliders = world:queryRectangleArea(ex + (20 * enemy.direction), ey + 20, 20, 20, {'Platform'})
        if #colliders == 0 then
            enemy.direction = enemy.direction * -1
        end

        enemy:setX(ex + enemy.speed * dt * enemy.direction)
    end
end

-- local ex, ey = e:getPosition()

-- local colliders = world:queryRectangleArea(ex + (40 * e.direction), ey + 40, 10, 10, {'Platform'})
-- if #colliders == 0 then
--     e.direction = e.direction * -1
-- end

-- e:setX(ex + e.speed * dt * e.direction)


function enemies:draw()
    local enemyWidth = sprites.enemy:getHeight() / 2
    local enemyHeight = sprites.enemy:getHeight() / 2 - 16
    for i, enemy in ipairs(enemies) do
        local ex, ey = enemy:getPosition()
        love.graphics.draw(sprites.enemy, ex - enemyWidth, ey - enemyHeight)
    end
end