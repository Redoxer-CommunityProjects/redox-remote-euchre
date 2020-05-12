require 'assets/pages/game/drawing'
require 'euchreEngine'
require 'assets/pages/game/updating'
local Button = require 'classes/button'
local ButtonManager = require 'classes/buttonManager'

local bidding = {}
local biddingTime = 0

local buttonManager = ButtonManager.new()
function printPress()
    print('button pressed')
end

-- start a game!
function bidding:enter()
    startGame()
    firstRoundBidding()
    local firstRoundTrump = Button.new(
        love.graphics.newImage('assets/buttons/'..gameState.currentHand.kitty[1][2]..'_icon.png'),
        735, 315, 64, 64, printPress)
    buttonManager:addButton(1, firstRoundTrump)
end

function bidding:update(dt)
    biddingTime = biddingTime + dt
    animateIndicator(dt)
    buttonManager:update(dt)
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
    buttonManager:draw() -- draw all the buttons being managed
end

function bidding:mousepressed(x, y, button, istouch)
    buttonManager:handleMouseClick(x, y, button)
 end

return bidding