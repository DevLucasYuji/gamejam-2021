-- Screen Size
window = {}
window.width = 1280
window.height = 720

-- Import Libs
cameraFile = require 'libraries/hump/camera'
windfield = require 'libraries/windfield/windfield'
sti = require 'libraries/Simple-Tiled-Implementation/sti'

-- Load world
world = windfield.newWorld(0, 800, false)

SCORE = 0
SLEEP = false

-- Import packages
require 'game/game'
require 'sound'
require 'sprites'
require 'hud'
require 'platform'
require 'danger'
require 'enemy'
require 'ruby'
require 'jarvis'
require 'player'
require 'map'

-- Current Game state
GAMESTATE = game.state.resume
GAMEMAP = loadMap(level.one)

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
        world:addCollisionClass('Jarvis')
        world:addCollisionClass('Ruby')
        world:addCollisionClass('Enemy')
    -- end colliders

    player:load()
end

function love.update(dt)
    GAMESTATE.update(dt)
end

function love.draw()
    -- love.graphics.draw(GAMEMAP.currentLevel.background, 0, 0)
    cam:attach()
        GAMESTATE.draw()
    cam:detach()
end

function love.keypressed(key)
    if GAMESTATE.keypressed then
        GAMESTATE.keypressed(key)
    end
end