local MAP_DIR = "assets/map/"
local EXTENSION_LUA = ".lua"

-- Global levels
level = {
    one = "level1",
    two = "level2",
    test = "level_test"
}

function loadMap(mapName)
    return sti(MAP_DIR .. mapName .. EXTENSION_LUA)
end

function updateMap(mapName)
    GAMEMAP = loadMap(mapName)
end

function drawMap(map)
    local background = GAMEMAP.layers["background"]
    
    -- load background layers
    if background then
        GAMEMAP:drawLayer(background)
    end

    -- load platforms layers
    local platformLayer = GAMEMAP.layers["platform"]
    if platformLayer then
        platforms:draw(platformLayer.objects)
    end
end