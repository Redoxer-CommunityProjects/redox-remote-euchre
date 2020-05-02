require 'assets/pages/game/drawing'
require 'euchreEngine'
require 'assets/pages/game/updating'

local bidding = {}
local biddingTime = 0

-- start a game!
function bidding:enter()
    startGame()
    firstRoundBidding()
end

function bidding:update(dt)
    biddingTime = biddingTime + dt
    animateIndicator(dt)
    -- temp - just move the indicator around
    if (biddingTime > 2) then
        moveArrowPos()
        biddingTime = 0
    end
end

function bidding:draw()
    drawHands()
    -- draw the kitty as well!
    drawKitty()
    drawDealerButton()
    drawBiddingArrow()
end

return bidding