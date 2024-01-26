local pd <const> = playdate
local gfx <const> = pd.graphics

class('scenemanager').extends()

function scenemanager:init()
    self.transitioning = false
end

function scenemanager:switchscene(scene, ...)
    self.newscene = scene
    self.sceneargs = {...}
    pd.inputHandlers.pop() -- Pop the scene's input handler off the stack.
    self:loadnewscene()
end

function scenemanager:loadnewscene()
    self:cleanupscene()
    self.newscene(table.unpack(self.sceneargs))
end

function scenemanager:cleanupscene()
    closepopup() -- Close any active popups that may be lingering.
    assets = nil -- Nil all the assets,
    vars = nil -- and nil all the variables.
    gfx.sprite.removeAll() -- Remove every sprite,
    self:removealltimers() -- Remove every timer,
    collectgarbage('collect') -- and collect the garbage.
    gfx.setDrawOffset(0, 0) -- Lastly, reset the drawing offset. just in case.
end

function scenemanager:removealltimers()
    local alltimers = pd.timer.allTimers()
    for _, timer in ipairs(alltimers) do
        timer:remove()
    end
end