local iffy = require 'assets/libraries/iffy'
local iffyCards, iffyCardBacks

local scaleCards = 0.8

function love.load()
    -- load our card sprites in to the iffy cache, get the splash page with menu options
    iffy.newAtlas('assets/sprites/playingCards.png')
    iffy.newAtlas('assets/sprites/playingCardBacks.png')
    print(iffy.getSprite('cardClubsK.png'))
end

function love.update(dt)

end

function love.draw()
    love.graphics.setBackgroundColor(0, 120/255, 0) -- a sweet sweet felt green :)
    iffy.drawSprite('cardClubsK.png', love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0, scaleCards)
end