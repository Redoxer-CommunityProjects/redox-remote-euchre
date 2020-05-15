local iffy = require 'assets/libraries/iffy'

local Kitty = {};

-- ------------------------------------------------
-- Constructor
-- ------------------------------------------------

function Kitty.new(kitty, x, y, rotation, showTop)
    local self = {}

    self.kitty = kitty
    self.x = x
    self.y = y
    self.rotation = rotation
    self.showTop = showTop

    function self:flipTop()
        self.showTop = not self.showTop
    end

    function self:draw()
        for i = #self.kitty, 1, -1 do -- yea, it's great controlling the inputs
            local cardName = ''
            if (i == 1 and self.showTop) then
                cardName = 'card'..self.kitty[i][1]..'.png'
            else
                cardName = 'cardBack_r.png'
            end
            iffy.drawSprite(cardName, self.x, self.y, self.rotation * math.pi/180, initVars.scaleCards)
        end
    end

    function self:update()
        
    end

    function self:moveOut()
    end

    return self;
end

-- ------------------------------------------------
-- Return Module
-- ------------------------------------------------

return Kitty;