require 'assets/pages/game/drawing'
require 'euchreEngine'

local inGame = {}

-- start a game!
function inGame:enter()

end

function inGame:draw()
    drawHands()
    drawDealerButton()
end

return inGame