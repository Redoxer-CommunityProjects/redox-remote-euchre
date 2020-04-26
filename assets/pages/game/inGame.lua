require 'assets/pages/game/drawing'

local inGame = {}

function inGame:draw()
    drawHands()
    -- draw the kitty as well!
    drawKitty()
    drawDealerButton()
end

return inGame