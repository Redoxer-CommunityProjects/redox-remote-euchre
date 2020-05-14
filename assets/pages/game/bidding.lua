require 'assets/pages/game/drawing'
require 'euchreEngine'
require 'assets/pages/game/updating'
local Button = require 'classes/button'
local ButtonManager = require 'classes/buttonManager'

local bidding = {}

local buttonManager = ButtonManager.new()
local firstRoundTrump
local pass
function printPress()
    print('button pressed')
end

-- start a game!
function bidding:enter()
    startGame()
    firstRoundBidding()
    firstRoundTrump = Button.new(
        love.graphics.newImage('assets/buttons/'..gameState.currentHand.kitty[1][2]..'_icon.png'),
        735, 315, 64, 64, printPress)
end

function bidding:update(dt)
    animateIndicator(dt)
    -- if it is my turn, add our buttons!
    if gameState.currentHand.bidding.currentChoice == 'myPlayer' then
        if buttonManager:buttonExists(1) ~= true then
            buttonManager:addButton(1, firstRoundTrump)
        end
    end
    buttonManager:update(dt)
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