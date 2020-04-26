require 'assets/libraries/helperFns'

local iffy = require 'assets/libraries/iffy'
-- load in our sprite sheets
iffy.newAtlas('assets/sprites/playingCards.png')
iffy.newAtlas('assets/sprites/RplayingCardBacks.png')
-- load in the one-off dealer button image
iffy.newImage('dealerImage', 'assets/sprites/dealer.png')
iffy.newSprite('dealerImage', 'dealer.png', 0, 0, 64, 64)

function drawHands ()
    local handLayer = drawLayers.layers[4]
    local playerHandIndex = table.generateValueIndex('properties.player', handLayer.objects)
    for _,info in ipairs(gameState.tableOrder) do
        local player = gameState[info]
        local cardNumb = 1
        local cardPositions = playerHandIndex[info]
        for _,card in ipairs(player) do
            local cardName = ''
            local thisCardPos = cardPositions[cardNumb]
            if (info == 'myPlayer') then
                cardName = 'card'..card[1]..'.png'
            else
                cardName = 'cardBack_r.png'
            end
            iffy.drawSprite(cardName, thisCardPos.x,
                thisCardPos.y, thisCardPos.rotation * math.pi/180, initVars.scaleCards)
            cardNumb = cardNumb + 1
        end
    end
end

function drawKitty ()
    for i = #gameState.currentHand.kitty, 1, -1 do
        local kittyPos = drawLayers.layers[3].objects[2] -- yea, it's great controlling the inputs
        local cardName = ''
        if (i == 1) then
            cardName = 'card'..gameState.currentHand.kitty[i][1]..'.png'
        else
            cardName = 'cardBack_r.png'
        end
        iffy.drawSprite(cardName, kittyPos.x, kittyPos.y, kittyPos.rotation * math.pi/180, initVars.scaleCards)
    end
end

function drawDealerButton ()
    local dealerPos = gameState.dealerPos
    local dealerName = gameState.tableOrder[dealerPos]
    -- button positions are in gameLayers
    local playerPos = drawLayers.layers[2].objects
    -- this is a function that we use to find the right dealer position from the drawLayers
    function findDealer(v)
        return v.name == dealerName
    end
    local currentDealerPos = table.find(findDealer, playerPos)
    iffy.drawSprite('dealer.png', currentDealerPos.x, currentDealerPos.y, 0, 1)
end