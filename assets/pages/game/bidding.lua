require 'assets/pages/game/drawing'
require 'euchreEngine'

local bidding = {}

-- start a game!
function bidding:enter()
    startGame()
    firstRoundBidding()
end

function bidding:draw()
    drawHands()
    -- draw the kitty as well!
    drawKitty()
    drawDealerButton()
    drawBiddingArrow()
end

return bidding