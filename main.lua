require 'euchreEngine'

local iffy = require 'assets/libraries/iffy'
local iffyCards, iffyCardBacks

local scaleCards = 0.8
local euchreDeck = {
    { 'Clubs9', 'Clubs', '9' },
    { 'Clubs10', 'Clubs', '10' },
    { 'ClubsJ', 'Clubs', 'J' },
    { 'ClubsQ', 'Clubs', 'Q' },
    { 'ClubsK', 'Clubs', 'K' },
    { 'ClubsA', 'Clubs', 'A' },
    { 'Hearts9', 'Hearts', '9' },
    { 'Hearts10', 'Hearts', '10' },
    { 'HeartsJ', 'Hearts', 'J' },
    { 'HeartsQ', 'Hearts', 'Q' },
    { 'HeartsK', 'Hearts', 'K' },
    { 'HeartsA', 'Hearts', 'A' },
    { 'Diamonds9', 'Diamonds', '9' },
    { 'Diamonds10', 'Diamonds', '10' },
    { 'DiamondsJ', 'Diamonds', 'J' },
    { 'DiamondsQ', 'Diamonds', 'Q' },
    { 'DiamondsK', 'Diamonds', 'K' },
    { 'DiamondsA', 'Diamonds', 'A' },
    { 'Spades9', 'Spades', '9' },
    { 'Spades10', 'Spades', '10' },
    { 'SpadesJ', 'Spades', 'J' },
    { 'SpadesQ', 'Spades', 'Q' },
    { 'SpadesK', 'Spades', 'K' },
    { 'SpadesA', 'Spades', 'A' },
}

local shuffledDeck = {}

function love.load()
    -- load our card sprites in to the iffy cache, get the splash page with menu options
    iffy.newAtlas('assets/sprites/playingCards.png')
    iffy.newAtlas('assets/sprites/playingCardBacks.png')
    -- shuffle like 8 bajillion times.
    shuffledDeck = shuffleDeck(euchreDeck) -- this is our initial shuffled deck. we'll shuffle more later ;)
end

function love.update(dt)

end

function love.draw()
    love.graphics.setBackgroundColor(0, 120/255, 0) -- a sweet sweet felt green :)
    local x, y = love.graphics.getHeight()/2, 30
    for _,info in ipairs(shuffledDeck) do
        iffy.drawSprite('card'..info[1]..'.png', y, x, 0, scaleCards)
        y = y + 30
    end
end