local AUDIO_DIR = "assets/audio/"
sound = {}
sound.jump = love.audio.newSource(AUDIO_DIR .. "jump.wav", "static")
sound.gameover = love.audio.newSource(AUDIO_DIR .. "dead.wav", "static")
sound.ruby = love.audio.newSource(AUDIO_DIR .. "ruby.wav", "static")


sound.level1 = love.audio.newSource(AUDIO_DIR .. "level1.mp3", "static")
sound.level2 = love.audio.newSource(AUDIO_DIR .. "level2.mp3", "static")
-- sound.level3 = love.audio.newSource(AUDIO_DIR .. "leve3.mp3", "static")