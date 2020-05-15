require 'assets/pages/game/drawing'
require 'euchreEngine'
require 'assets/pages/game/updating'
require 'assets/pages/game/biddingSupport/firstRound'

local Button = require 'classes/button'
local ButtonManager = require 'classes/buttonManager'
local Kitty = require 'classes/kitty'

local bidding = {}
local biddingTime = 0

local buttonManager = ButtonManager.new()
local firstRoundTrump, kitty
local pass

-- start a game!
function bidding:enter()
    startGame()
    firstRoundBidding()

    local firstRoundSuit = gameState.currentHand.kitty[1][2]
    local initKittyPos = drawLayers.layers[3].objects[2]

    kitty = Kitty.new(gameState.currentHand.kitty, initKittyPos.x, initKittyPos.y, initKittyPos.rotation, true)
    firstRoundTrump = Button.new(
        love.graphics.newImage('assets/buttons/'..firstRoundSuit..'_icon.png'),
        735, 315, 64, 64, trumpChosen, firstRoundSuit)
end

function bidding:update(dt)
    biddingTime = biddingTime + dt
    animateIndicator(dt)
    -- if it is my turn, add our buttons!
    if gameState.currentHand.bidding.currentChoice == 'myPlayer' then
        if buttonManager:buttonExists(1) ~= true then
            buttonManager:addButton(1, firstRoundTrump)
        end
    else -- for now, just move the arrow to our position
        if biddingTime > 3 then
            biddingTime = 0
            moveArrowPos()
        end
    end
    buttonManager:update(dt)
end

function bidding:draw()
    drawHands()
    kitty:draw()
    drawDealerButton()
    drawBiddingArrow()
    buttonManager:draw() -- draw all the buttons being managed
end

function bidding:mousepressed(x, y, button, istouch)
    buttonManager:handleMouseClick(x, y, button)
end

function bidding:leave(next)
    -- clean up our buttons
    buttonManager:removeAllButtons()
    -- pass our kitty!
    next:getKitty(kitty)
end

return bidding