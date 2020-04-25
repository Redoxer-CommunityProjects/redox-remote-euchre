local iffy = require 'assets/libraries/iffy'
iffy.newAtlas('assets/sprites/playingCards.png')
iffy.newAtlas('assets/sprites/RplayingCardBacks.png')

local inGame = {}

function inGame:draw()
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

return inGame