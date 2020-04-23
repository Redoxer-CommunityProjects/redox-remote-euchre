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

local gameState = {
    myPlayer = {},
    opp1 = {},
    opp2 = {},
    partner = {},
    score = {},
    currentHand = {},
    deck = {},
    tableOrder = { 'myPlayer', 'opp1', 'partner', 'opp2'}
}

local shuffledDeck = {}

function love.load()
    -- load our card sprites in to the iffy cache, get the splash page with menu options
    iffy.newAtlas('assets/sprites/playingCards.png')
    iffy.newAtlas('assets/sprites/playingCardBacks.png')
    -- shuffle like 8 bajillion times.
    shuffledDeck = shuffleDeck(euchreDeck) -- this is our initial shuffled deck. we'll shuffle more later ;)
    gameState.deck = shuffledDeck
    gameState = startGame(gameState) -- testing code right now. This will move behind other code later
end

function love.update(dt)

end

function love.draw()
    love.graphics.setBackgroundColor(0, 120/255, 0) -- a sweet sweet felt green :)
    
    -- temporarily: draw each persons hand, print dealer position, print deck
    -- to ensure we are dealing correctly!
    love.graphics.print('Dealer: '..gameState.dealerPos, 1100, 10)
    local x, y = 360, 400
    for _,info in ipairs(shuffledDeck) do
        iffy.drawSprite('card'..info[1]..'.png', y, x, 0, scaleCards)
        y = y + 30
    end
    x = 50
    y = 30
    for _,info in ipairs(gameState.tableOrder) do
        y = 30
        local player = gameState[info]
        for _,card in ipairs(player) do
            iffy.drawSprite('card'..card[1]..'.png', y, x, 0, scaleCards)
            y = y + 30
        end
        x = x + 180
    end
end