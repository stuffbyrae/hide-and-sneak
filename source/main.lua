-- Importing things
import 'CoreLibs/ui'
import 'CoreLibs/math'
import 'CoreLibs/timer'
import 'CoreLibs/object'
import 'CoreLibs/sprites'
import 'CoreLibs/graphics'
import 'scenemanager'
scenemanager = scenemanager()

moles = false
instructions = false

-- Setting up basic SDK params
local pd <const> = playdate
local gfx <const> = pd.graphics

pd.display.setRefreshRate(20)
gfx.setBackgroundColor(gfx.kColorBlack)

-- Setting up music
music = nil

-- This function sets a new music track, and should be called at the bottom of a new scene's init() function.
-- 'file' is a string, and should point to a valid music file inside the game's bundle.
-- 'loop' is a boolean, and if true it'll loop the track endlessly until faded out with fademusic().
-- 'range' is a number, which defines the starting range for the music to loop from after the first play.
-- Not very modular, but it's how I need it :3
function newmusic(file, loop, range)
    if music == nil then -- If a music file isn't actively playing...then go ahead and set a new one.
        music = pd.sound.fileplayer.new(file)
        music:setVolume(save.vol_music)
        music:setStopOnUnderrun(flag)
        if loop then -- If set to loop, then ... loop it!
            music:setLoopRange(range or 0)
            music:play(0)
        else
            music:play()
        end
    end
end

-- This function fades out an active music file.
-- 'delay' is a number; determines the number of milliseconds to fade out.
function fademusic(delay)
    delay = delay or 950
    if music ~= nil then
        music:setVolume(0, 0, delay/1000, function()
            music:stop()
            music = nil
        end)
    end
end

-- When the game closes...
function pd.gameWillTerminate()
end

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end