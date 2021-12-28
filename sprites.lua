sprites = {}

sprites.player = love.graphics.newImage('assets/sprites/player.png')
sprites.player:setFilter("nearest", "nearest")

sprites.ruby = love.graphics.newImage('assets/sprites/ruby.png')
sprites.ruby:setFilter("nearest", "nearest")

-- TODO: set image to enemy
sprites.enemy = love.graphics.newImage('assets/sprites/ruby.png')
sprites.ruby:setFilter("nearest", "nearest")