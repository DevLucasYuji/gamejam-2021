local MAP_DIR = "assets/map/"
local EXTENSION_LUA = ".lua"

-- Global levels
level = {
    one = {
        name = "level1",
        phase = "passado",
        sound = sound.level1,
        volume = 0.1,
        background = sprites.level1
    },
    two = {
        name = "level2",
        phase = "presente",
        sound = sound.level2,
        volume = 0.2,
        background = sprites.level2
    },
    three = {
        name = "level3",
        phase = "futuro",
        sound = sound.level3,
        volume = 0.1,
        background = sprites.level3
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

    -- load enemy layers
    loadObjectMap(map, enemies, "enemy")

    map.currentLevel = mapLevel

    playMapSound(mapLevel)

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

function stopMapSound(mapLevel)
    mapLevel.sound:stop()
end

function playMapSound(mapLevel)
    mapLevel.sound:play()
    mapLevel.sound:setVolume(mapLevel.volume)
    mapLevel.sound:setLooping(true)
end

function loadNextMap()
    local mapName

    local levels = #level

    if GAMEMAP.currentLevel.name == level.one.name then
        mapName = level.two
    elseif GAMEMAP.currentLevel.name == level.two.name then
        mapName = level.three
    end

    if mapName then 
        stopMapSound(GAMEMAP.currentLevel)
        SCORE = 0
        sound:playTeleport()

        updateMap(mapName) 
    end
end

function drawMap()    
    -- load background layers
    if GAMEMAP.layers["background"] then
        GAMEMAP:drawLayer(GAMEMAP.layers["background"])
    end

    rubys:draw()

    enemies:draw()
end

function clearMap()
    platforms:clear()
    jarvis:clear()
    rubys:clear()
    enemies:clear()
end