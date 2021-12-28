local MAP_DIR = "assets/map/"
local EXTENSION_LUA = ".lua"

-- Global levels
level = {
    one = {
        name = "level1",
        phase = "passado",
        background = sprites.level1
    },
    two = {
        name = "level2",
        phase = "presente",
        background = sprites.level2
    }
}

function loadMap(mapLevel)
    local map = sti(MAP_DIR .. mapLevel.name .. EXTENSION_LUA)

    -- load platforms layers
    loadObjectMap(map, platforms, "platform")

    -- load player position layer
    loadObjectMap(map, player, "player")

    -- load jarvis position layer
    loadObjectMap(map, jarvis, "jarvis")

    -- load rubys layers
    loadObjectMap(map, rubys, "ruby")

    map.currentLevel = mapLevel

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

    if GAMEMAP.currentLevel.name == level.one.name then
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

    rubys:draw()
end

function clearMap()
    platforms:clear()
    jarvis:clear()
    rubys:clear()
end