enemies = {}

function spawnEnemies(x, y)
    local enemy = world:newRectangleCollider(x, y, 64, 64, {collision_class = "Enemy"})
    enemy:setFixedRotation(true)
    local ex, ey = enemy:getPosition()
    enemy.pivotX = ex
    enemy.speed = 180
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
        if ex > enemy.pivotX + 300 then
            enemy.direction = -1
        end
        
        if ex < enemy.pivotX - 300 then
            enemy.direction = 1
        end
        
        local colliders = world:queryRectangleArea(ex + (20 * enemy.direction), ey + 20, 20, 20, {'Platform'})
        if #colliders == 0 or #colliders > 1 then
            enemy.direction = enemy.direction * -1
        end

        enemy:setX(ex + enemy.speed * dt * enemy.direction)
    end
end

function enemies:draw()
    for i, enemy in ipairs(enemies) do
        love.graphics.draw(
            sprites.enemy, 
            enemy:getX() - sprites.enemy:getHeight() / 2, 
            enemy:getY() - sprites.enemy:getHeight() / 4
        )
    end
end