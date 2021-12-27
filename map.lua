local MAP_DIR = "assets/map/"
local EXTENSION_LUA = ".lua"

-- Global levels
level = {
    one = "level1",
    two = "level2",
    test = "level_test"
}

function loadMap(mapName)
    local map = sti(MAP_DIR .. mapName .. EXTENSION_LUA)

    -- TODO: reset map

    -- load platforms layers
    local platformLayer = map.layers["platform"]
    if platformLayer then
        platforms:draw(platformLayer.objects)
    end

    -- load player position layer
    local playerLayer = map.layers["player"]
    if playerLayer then
        player:initPosition(playerLayer.objects)
    end

    return map
end

function updateMap(mapName)
    GAMEMAP = loadMap(mapName)
end

function drawMap()
    local background = GAMEMAP.layers["background"]
    
    -- load background layers
    if background then
        GAMEMAP:drawLayer(background)
    end
end