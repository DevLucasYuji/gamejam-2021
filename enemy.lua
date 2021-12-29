enemies = {}

enemy = {}
ex = 0
ey = 0
enemySize = 0
enemyColliders = 0

function spawnEnemies(x, y)
    enemy = world:newRectangleCollider(x, y, 64, 64, {collision_class = "Enemy"})
    enemy:setFixedRotation(true)
    ex, ey = enemy:getPosition()
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
    enemySize = #enemies
    while enemySize > -1 do
        if enemies[enemySize] ~= nil then
            enemies[enemySize]:destroy()
        end
        table.remove(enemies, i)
        enemySize = enemySize - 1
    end
end

function enemies:drawLayer()
    
end

function enemies:update(dt)
    for i, enemy in ipairs(enemies) do
        ex, ey = enemy:getPosition()
        if ex > enemy.pivotX + 300 then
            enemy.direction = -1
        end
        
        if ex < enemy.pivotX - 300 then
            enemy.direction = 1
        end
        
        enemyColliders = world:queryRectangleArea(ex + (20 * enemy.direction), ey + 20, 20, 20, {'Platform'})
        if #enemyColliders == 0 or #enemyColliders > 1 then
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