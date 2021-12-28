game = {}
game.mode = {}
game.state = {}

-- Game States
require 'game/game_resume'
require 'game/game_over'

game.state.resume = {
    update = function(dt) updateGameResume(dt) end,
    draw = function() drawGameResume() end,
    keypressed = function(key) keypressedResume(key) end
}

game.state.gameover = {
    update = function(dt) updateGameOver(dt) end,
    draw = function() drawGameOver() end,
    keypressed = function(key) keypressedGameOver(key) end
}

function resetGame()
    player:load()
    SCORE = 0
    GAMESTATE = game.state.resume
    updateMap(GAMEMAP.currentLevel)
end

function drawGame()
    player:draw()
    jarvis:draw()
    enemies:draw()
end