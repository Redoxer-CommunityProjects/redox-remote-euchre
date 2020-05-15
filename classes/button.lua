local Button = {};

-- ------------------------------------------------
-- Constructor
-- ------------------------------------------------

function Button.new(img, x, y, w, h, target, suit)
    local self = {}

    local active
    local alpha

    self.x = x
    self.y = y
    self.suit = suit
    local origY = y

    self.width = w
    self.height = h

    function self:draw()
        love.graphics.setColor(255, 255, 255, alpha)
        love.graphics.draw(img, self.x, self.y)
        love.graphics.setColor(255, 255, 255, 255)
    end

    function self:update()
        alpha = active and 255 or 100
    end

    function self:setActive(_active)
        active = _active
    end

    function self:highlight()
        -- move up two pixels, change color?
        if self.y == origY then
            self.y = self.y - 5
        end
    end

    function self:rest()
        -- if we've moved, let's move back
        -- this represents the mouse moving off self
        if self.y ~= origY then
            self.y = origY
        end
    end

    function self:press()
        target(self.suit, self) -- what action happens when this is pressed
    end

    return self;
end

-- ------------------------------------------------
-- Return Module
-- ------------------------------------------------

return Button;