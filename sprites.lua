sprites = {}

sprites.player = love.graphics.newImage('assets/sprites/player.png')
sprites.player:setFilter("nearest", "nearest")

sprites.ruby = love.graphics.newImage('assets/sprites/ruby.png')
sprites.ruby:setFilter("nearest", "nearest")

sprites.jarvis = love.graphics.newImage('assets/sprites/jarvis.png')
sprites.jarvis:setFilter("nearest", "nearest")

-- TODO: set image to enemy
sprites.enemy = love.graphics.newImage('assets/sprites/ruby.png')
sprites.enemy:setFilter("nearest", "nearest")

sprites.level1 = love.graphics.newImage('assets/background/level1.png')
sprites.level2 = love.graphics.newImage('assets/background/level1.png')
