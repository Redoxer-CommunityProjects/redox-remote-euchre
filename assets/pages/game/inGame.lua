require 'assets/pages/game/drawing'
require 'euchreEngine'

local inGame = {}
local kitty

function inGame:getKitty(prevKitty)
    kitty = prevKitty
    kitty:flipTop()
end
-- starting tricks!!
function inGame:enter()

end

function inGame:update()

end

function inGame:draw()
    drawHands()
    kitty:draw()
    drawDealerButton()
end

return inGame