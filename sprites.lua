sprites = {}

sprites.player = love.graphics.newImage('assets/sprites/brando-spritesheet.png')
sprites.player:setFilter("nearest", "nearest")

sprites.ruby = love.graphics.newImage('assets/sprites/ruby-sprite.png')
sprites.ruby:setFilter("nearest", "nearest")

sprites.jarvis = love.graphics.newImage('assets/sprites/jarvis.png')
sprites.jarvis:setFilter("nearest", "nearest")

sprites.enemy = love.graphics.newImage('assets/sprites/enemy.png')
sprites.enemy:setFilter("nearest", "nearest")

sprites.level1 = love.graphics.newImage('assets/background/level1.png')
sprites.level2 = love.graphics.newImage('assets/background/level1.png')
sprites.level3 = love.graphics.newImage('assets/background/level1.png')

