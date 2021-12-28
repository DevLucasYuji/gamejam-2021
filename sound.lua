local AUDIO_DIR = "assets/audio/"
sound = {}
sound.jump = love.audio.newSource(AUDIO_DIR .. "jump.wav", "static")
sound.gameover = love.audio.newSource(AUDIO_DIR .. "dead.wav", "static")
sound.ruby = love.audio.newSource(AUDIO_DIR .. "ruby.wav", "static")
sound.teleport = love.audio.newSource(AUDIO_DIR .. "teleport.wav", "static")

sound.level1 = love.audio.newSource(AUDIO_DIR .. "level1.mp3", "static")
sound.level2 = love.audio.newSource(AUDIO_DIR .. "level2.mp3", "static")
sound.level3 = love.audio.newSource(AUDIO_DIR .. "level3.mp3", "static")

function sound:playTeleport()
    sound.teleport:play()
    -- love.timer.sleep(1.0)
end

function sound:playRuby()
    sound.ruby:setVolume(0.7)
    sound.ruby:stop()
    sound.ruby:play()
end

function sound:playJump()
    sound.jump:play()
end