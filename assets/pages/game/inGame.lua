require 'assets/pages/game/drawing'
require 'euchreEngine'

local inGame = {}

-- start a game!
function inGame:enter()
    startGame()
end

function inGame:draw()
    drawHands()
    -- draw the kitty as well!
    drawKitty()
    drawDealerButton()
end

return inGame