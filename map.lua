local MAP_DIR = "assets/map/"
local EXTENSION_LUA = ".lua"

-- Global levels
level = {
    one = "level1",
    two = "level2"
}

function loadMap(mapName)
    local map = sti(MAP_DIR .. mapName .. EXTENSION_LUA)

    -- load platforms layers
    loadObjectMap(map, platforms, "platform")

    -- load player position layer
    loadObjectMap(map, player, "player")

    -- load jarvis position layer
    loadObjectMap(map, jarvis, "jarvis")

    map.currentLevel = mapName

    return map
end

function loadObjectMap(map, object, layerName)
    local layer = map.layers[layerName]
    if layer and layer.objects then
        object:loadLayer(layer.objects)
    end
end

function updateMap(mapName)
    clearMap()
    GAMEMAP = loadMap(mapName)
end

function loadNextMap()
    local mapName

    if GAMEMAP.currentLevel == level.one then
        mapName = level.two
    end

    if mapName then 
        updateMap(mapName) 
    end
end

function drawMap()
    local background = GAMEMAP.layers["background"]
    
    -- load background layers
    if background then
        GAMEMAP:drawLayer(background)
    end
end

function clearMap()
    platforms:clear()
    jarvis:clear()
end