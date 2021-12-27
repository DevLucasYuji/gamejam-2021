-- Screen Size
window = {}
window.width = 1120
window.height = 768

-- Import Libs
cameraFile = require 'libraries/hump/camera'
windfield = require 'libraries/windfield/windfield'
sti = require 'libraries/Simple-Tiled-Implementation/sti'

-- Load world
world = windfield.newWorld(0, 800, false)

-- Import packages
require 'sound'
require 'game/game'
require 'platform'
require 'player'
require 'map'

-- Current Game state
GAMESTATE = game.state.resume
GAMEMAP = loadMap(level.test)

function love.load()
    -- init setup
        love.window.setMode(window.width, window.height)
        cam = cameraFile()
        world:setQueryDebugDrawing(true)
    -- end setup

    -- colliders
        world:addCollisionClass('Platform')
        world:addCollisionClass('Player')
        world:addCollisionClass('Danger')
    -- end colliders

    player:load()
end

function love.update(dt)
    GAMESTATE.update(dt)
end

function love.draw()
    cam:attach()
        GAMESTATE.draw()
    cam:detach()
end

function love.keypressed(key)
    if GAMESTATE.keypressed then
        GAMESTATE.keypressed(key)
    end
end