-- Importing things
import 'CoreLibs/ui'
import 'CoreLibs/math'
import 'CoreLibs/timer'
import 'CoreLibs/object'
import 'CoreLibs/sprites'
import 'CoreLibs/graphics'
import 'scenemanager'
scenemanager = scenemanager()

-- Setting up basic SDK params
local pd <const> = playdate
local gfx <const> = pd.graphics

pd.display.setRefreshRate(30)
gfx.setBackgroundColor(gfx.kColorBlack)

-- When the game closes...
function pd.gameWillTerminate()
end

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end