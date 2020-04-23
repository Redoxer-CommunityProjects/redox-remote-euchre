require 'euchreEngine'
local manager = require 'assets/libraries/roomy'.new()
local state = require 'assets/pages/state'
local iffy = require 'assets/libraries/iffy'
local iffyCards, iffyCardBacks

local initVars = require 'initVariables'
local gameState = initVars.gameState

local shuffledDeck = {}

function love.load()
    -- load our card sprites in to the iffy cache, get the splash page with menu options
    iffy.newAtlas('assets/sprites/playingCards.png')
    iffy.newAtlas('assets/sprites/playingCardBacks.png')
    -- shuffle like 8 bajillion times.
    shuffledDeck = shuffleDeck(initVars.euchreDeck) -- this is our initial shuffled deck. we'll shuffle more later ;)
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
        iffy.drawSprite('card'..info[1]..'.png', y, x, 0, initVars.scaleCards)
        y = y + 30
    end
    x = 50
    y = 30
    for _,info in ipairs(gameState.tableOrder) do
        y = 30
        local player = gameState[info]
        for _,card in ipairs(player) do
            iffy.drawSprite('card'..card[1]..'.png', y, x, 0, initVars.scaleCards)
            y = y + 30
        end
        x = x + 180
    end
end