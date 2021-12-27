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

game.gameover = {
    update = function(dt) updateGameOver(dt) end,
    draw = function() drawGameOver() end,
    keypressed = nil
}
