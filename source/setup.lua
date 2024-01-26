-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics

class('setup').extends(gfx.sprite) -- Create the scene's class
function setup:init(...)
    setup.super.init(self)
    local args = {...} -- Arguments passed in through the scene management will arrive here
    show_crank = false -- Should the crank indicator be shown?
    gfx.sprite.setAlwaysRedraw(false) -- Should this scene redraw the sprites constantly?
    
    function pd.gameWillPause() -- When the game's paused...
        local menu = pd.getSystemMenu()
        menu:removeAllMenuItems()
    end
    
    assets = { -- All assets go here. Images, sounds, fonts, etc.
    }
    
    vars = { -- All variables go here. Args passed in from earlier, scene variables, etc.
    }
    vars.setupHandlers = {
        -- Input handlers go here...
    }
    pd.inputHandlers.push(vars.setupHandlers)

    if moles == false then
        if instructions == false then
            vars.setlist = {1, 2, 3, 5, 6, 10}
        else
            vars.setlist = {2, 10}
        end
    else
        if instructions == false then
            vars.setlist = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        else
            vars.setlist = {2, 9, 10}
        end
    end

    gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height) -- Background drawing
        -- Draw background stuff here...
    end)

    class('x1').extends(gfx.sprite)
    function x1:init()
        x1.super.init(self)
    end
    function x1:update()
    end

    -- Set the sprites
    self.x1 = x1()
    self:add()
end

-- Scene update loop
function setup:update()
end