require 'sound'
require 'game/game'
require 'player'

-- Current Game state
GAMESTATE = game.state.resume

function love.load()
    player:load()
end

function love.update(dt)
    GAMESTATE.update(dt)
end

function love.draw()
    GAMESTATE.draw()
end